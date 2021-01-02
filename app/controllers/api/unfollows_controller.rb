class Api::UnfollowsController < Api::ApplicationController
  def create
    unfollow_status = current_user.unfollow!(params[:account_id])
    render json: { status: 'ok' }
  end
end