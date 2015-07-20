class RedemptionsController < ApplicationController
  http_basic_authenticate_with name: "paritycube", password: "desidime123", only: :index
  before_action :authenticate, only: [ :create ]

  def index
    page = params[:page] || 1
    @redemption_type = params[:redemption_type] || 'mugs'
    @redemptions = Redemption.where('redemption_type = ?', @redemption_type).order('id desc').paginate(:page => page, :per_page => 20)
    respond_to do |format|
      format.html # index.html.erb
      format.csv {send_data  Redemption.where('redemption_type = ?', @redemption_type).order('id desc').to_csv, :type => 'text/csv' , :disposition => "attachment; filename=redemption.csv"}
    end
  end

  def create
    redemption = Redemption.new(reddeption_params)
    if redemption.save
      render json: { errors: nil }, status: :created
    else
      render json: {errors: redemption.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  private
    def authenticate
      authenticate_or_request_with_http_token do |token, options|
        token == 'afe9858af42a4be14dbc14c3931d8f5c'
      end
    end

    def reddeption_params
      params.permit(:email, :name, :address, :pin_code, :contact_number, :redemption_type, :t_shirt_size)
    end

end
