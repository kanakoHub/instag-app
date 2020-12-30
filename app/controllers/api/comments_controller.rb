class Api::CommentsController < Api::ApplicationController
  def create
    @snap = Snap.find(params[:snap_id])
    @comment = @snap.comments.build(comment_params)
    @comment.save!
    imgsrc = url_for(@comment.user.profile.avatar)
    account = @comment.user.profile.account
    render json: { account: account, comment: @comment, imgsrc: imgsrc }
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end
end
