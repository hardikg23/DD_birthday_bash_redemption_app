class SurveysController < ApplicationController
  before_action :authenticate, only: [ :create ]

  def index
    # Survey.where("question_12 @> ?", '[Paytm, Pepperfry]')
     # Survey.where("question_12 && ?", '{Paytm, Flipkart}')
    page = params[:page] || 1
    @surveys = Survey.order('id desc').paginate(:page => page, :per_page => 20)
    @headers = @surveys.first.questions.keys
    respond_to do |format|
      format.html # index.html.erb
      format.csv {send_data  Survey.order('id desc').to_csv, :type => 'text/csv' , :disposition => "attachment; filename=Survey.csv"}
    end
  end

  def create
    survey = Survey.new(survey_params)
    if survey.save
      render json: { errors: nil }, status: :created
    else
      render json: {errors: survey.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  private
    def survey_params
      params.permit(:user_id, :email, :city, :latitude, :longitude, :survey_type).tap do |whitelisted|
        whitelisted[:questions] = params[:questions]#JSON.parse(params[:questions])
      end
    end
end
