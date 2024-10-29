class OvensController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery except: :check_status

  def index
    @ovens = current_user.ovens
  end

  def show
    @oven = current_user.ovens.find_by!(id: params[:id])
    @batch = @oven.batch_cookie
  end

  def check_status
    @oven = current_user.ovens.find_by!(id: params[:id])

    respond_to do |format|
      format.js { render json: @oven&.batch_cookie.as_json }
    end
  end

  def empty
    @oven = current_user.ovens.find_by!(id: params[:id])
    @oven.batch_cookie.update!(storage: current_user) if @oven.batch_cookie
    redirect_to @oven, alert: 'Oven emptied!'
  end
end
