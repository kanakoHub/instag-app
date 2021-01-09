# == Schema Information
#
# Table name: snaps
#
#  id          :bigint           not null, primary key
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_snaps_on_user_id  (user_id)
#
class Snap < ApplicationRecord
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :favorite_users, through: :likes, source: :user

  has_many :comments, dependent: :destroy

  has_many_attached :snaps

  validates :description, presence: true

  def time_difference
    # 時間
    hour_difference = (Time.zone.now - created_at).floor / (60 * 60)
    # 日
    day_difference = (Time.zone.now - created_at).floor / (60 * 60 * 24)
    # 月
    month_difference = (Time.zone.now - created_at).floor / (60 * 60 * 24 * 30)
    # 年
    year_difference = (Time.zone.now - created_at).floor / (60 * 60 * 24 * 30 * 12)

    if hour_difference / 24 < 1
      "#{hour_difference} hours ago"
    elsif day_difference / 30 < 1
      "#{day_difference} days ago"
    elsif month_difference / 12 < 1
      "#{month_difference} month ago"
    else
      "#{year_difference} years ago"
    end
  end

  def like_count
    likes.count
  end

  def author_name
    user.display_name
  end
end
