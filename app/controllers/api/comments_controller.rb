class Api::CommentsController < Api::ApplicationController
    
  def index
      snap = Snap.find(params[:snap_id])
      comments = snap.comments
      render json: comments
  end

  def create
      snap = Snap.find(params[:snap_id])
      @comment = snap.comments.build(comment_params)
      @comment.save!
      render json: @comment
  end
  
  private
  def comment_params
      params.require(:comment).permit(:content)
  end
end