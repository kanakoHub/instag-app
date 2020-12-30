class Api::LikesController < Api::ApplicationController
  def create
    snap = Snap.find(params[:snap_id])
    snap.likes.create!(user_id: current_user.id)

    render json: { status: 'ok' }
  end

  def destroy
    snap = Snap.find(params[:snap_id])
    like = snap.likes.find_by!(user_id: current_user.id)
    like.destroy!

    render json: { status: 'ok' }
  end
end
