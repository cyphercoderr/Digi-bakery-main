class BatchCookiesController < ApplicationController
  before_action :authenticate_user!

  def new
    @oven = current_user.ovens.find_by!(id: params[:oven_id])
    if @oven.batch_cookie
      redirect_to @oven, alert: 'A batch is already in the oven!'
    else
      @batch_cookie = @oven.build_batch_cookie
    end
  end

  def create
    @oven = current_user.ovens.find_by!(id: params[:oven_id])
    @batch_cookie = @oven.create_batch_cookie!(batch_params)
    CookieCookingJob.perform_later({id: @batch_cookie.id})
    redirect_to oven_path(@oven)
  end

  def check_status
    batch_cookie = current_user.ovens.find_by!(id: params[:oven_id])
    respond_to do |format|
      format.js 
    end
  end

  private

  def batch_params
    params.require(:batch_cookie).permit(:fillings, :count).merge(status: 'cooking')
  end
end
