class Api::LikesController < Api::ApplicationController
  # def show
  #     snap = Snap.find(params[:snap_id])
  #     like_status = current_user.has_liked?(snap)
  #     # binding.pry
  #     render json: { hasLiked: like_status }
  # end

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