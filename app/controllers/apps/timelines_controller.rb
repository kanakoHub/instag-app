class Apps::TimelinesController < Apps::ApplicationController
  def show
    user_ids = current_user.followings.pluck(:id)
    snaps = Snap.where(user_id: user_ids)
    @snaps = snaps.where(created_at: 24.hour.ago..Time.zone.now).joins('left join likes on likes.snap_id = snaps.id').group('snaps.id').order(id: 'DESC').limit(5)
  end
end
