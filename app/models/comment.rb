# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  snap_id    :bigint           not null
#
# Indexes
#
#  index_comments_on_snap_id  (snap_id)
#
class Comment < ApplicationRecord
  belongs_to :snap
  belongs_to :user

  validates :content, presence: true
end
