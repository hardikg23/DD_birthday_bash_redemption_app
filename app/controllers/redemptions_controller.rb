class RedemptionsController < ApplicationController
  before_action :authenticate, only: [ :create ]

  def index
    page = params[:page] || 1
    @redemption_type = params[:redemption_type] || 'mugs'
    @redemptions = Redemption.where('redemption_type = ? and deleted = ?', @redemption_type, false).order('id desc').paginate(:page => page, :per_page => 20)
    respond_to do |format|
      format.html # index.html.erb
      format.csv {send_data  Redemption.where('redemption_type = ? and deleted = ?', @redemption_type, false).order('id desc').to_csv, :type => 'text/csv' , :disposition => "attachment; filename=redemption.csv"}
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

  def delete_all
    Redemption.update_all(:deleted => true)
    redirect_to redemptions_path
  end

  private

    def reddeption_params
      params.permit(:email, :app_user_id, :event, :name, :address, :pin_code, :contact_number, :redemption_type, :t_shirt_size)
    end

end
