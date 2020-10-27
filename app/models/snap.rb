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
  
  has_many_attached :snaps
  
  validates :description, presence: true
end
