class Api::FollowsController < Api::ApplicationController
  def create
    follow_status = current_user.follow!(params[:account_id])
    render json: { status: 'ok' }
  end
end