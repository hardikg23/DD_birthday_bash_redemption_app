class GoldCoinSurveysController < ApplicationController
  before_action :authenticate, only: [ :create ]

  def index
    # GoldCoinSurvey.where("question_12 @> ?", '[Paytm, Pepperfry]')
     # GoldCoinSurvey.where("question_12 && ?", '{Paytm, Flipkart}')
    page = params[:page] || 1
    @surveys = GoldCoinSurvey.order('id desc').paginate(:page => page, :per_page => 20)
    respond_to do |format|
      format.html # index.html.erb
      format.csv {send_data  GoldCoinSurvey.order('id desc').to_csv, :type => 'text/csv' , :disposition => "attachment; filename=GoldCoinSurvey.csv"}
    end
  end

  def create
    survey = GoldCoinSurvey.new(survey_params)
    if survey.save
      render json: { errors: nil }, status: :created
    else
      render json: {errors: survey.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  private
    def survey_params
      params.permit(:user_id, :email, :city, :latitude, :longitude, :question_1, :question_2, :question_3, :question_3_input, :question_4, :question_5, :question_5_input, :question_6, :question_7, :question_7_input, :question_8, :question_9, :question_10, :question_11,:question_13, :question_13_input, :question_14,:question_15_input, :question_16, :question_16_input, :question_17, :question_17_input, :question_18, :question_18_input, :question_19, :question_20, question_12: [], question_15: [])
    end
end
