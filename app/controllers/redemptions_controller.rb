class RedemptionsController < ApplicationController
  http_basic_authenticate_with name: "paritycube", password: "desidime123", only: :index
  before_action :authenticate, only: [ :create ]

  def index
    render :text => "gello"
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
