class Apps::TimelinesController < Apps::ApplicationController
  def show
    user_ids = current_user.followings.pluck(:id)
    @snaps = Snap.where(user_id: user_ids).order(id: "DESC")
  end
end