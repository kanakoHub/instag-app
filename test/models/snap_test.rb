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
require 'test_helper'

class SnapTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
