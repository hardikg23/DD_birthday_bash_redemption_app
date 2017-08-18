class GoldCoinSurveysController < ApplicationController
  before_action :authenticate, only: [ :create ]

  def index
    # GoldCoinSurvey.where("question_12 @> ?", '[Paytm, Pepperfry]')
     # GoldCoinSurvey.where("question_12 && ?", '{Paytm, Flipkart}')
    page = params[:page] || 1
    @surveys = GoldCoinSurvey.order('id desc').where('deleted = ?', false).paginate(:page => page, :per_page => 20)
    respond_to do |format|
      format.html # index.html.erb
      format.csv {send_data  GoldCoinSurvey.order('id desc').where('deleted = ?', false).to_csv, :type => 'text/csv' , :disposition => "attachment; filename=GoldCoinSurvey.csv"}
    end
  end

  def create
    survey = GoldCoinSurvey.new(survey_params)
    survey.question_21 = JSON.parse(params["question_21"]) if params["question_21"].present?
    survey.question_22 = JSON.parse(params["question_22"]) if params["question_22"].present?
    survey.question_23 = JSON.parse(params["question_23"]) if params["question_23"].present?
    survey.question_24 = JSON.parse(params["question_24"]) if params["question_24"].present?
    if survey.save
      render json: { errors: nil }, status: :created
    else
      render json: {errors: survey.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  def delete_all
    GoldCoinSurvey.update_all(:deleted => true)
    redirect_to gold_coin_surveys_path
  end

  private
    def survey_params
      params.permit(:user_id, :email, :city, :latitude, :longitude, :event, :question_1, :question_2, :question_3, :question_4, :question_5, :question_6, :question_7, :question_8, :question_9, :question_10, :question_11, :question_13, question_12: [], question_15: [])
    end
end
