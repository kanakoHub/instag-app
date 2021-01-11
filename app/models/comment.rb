# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  snap_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_comments_on_snap_id  (snap_id)
#  index_comments_on_user_id  (user_id)
#
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :snap

  validates :content, presence: true

  after_save :send_email

  def author_name
    user.display_name
  end

  private

  def send_email
    users = User.all
    users.each do |user|
      CommentMailer.including_account(user, snap, content).deliver_later if content.include?("@#{user.display_name}")
    end
  end
end
