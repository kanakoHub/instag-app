require 'rails_helper'

module FollowsSpecHelper
  # 日時を年、月、日、時、分に分解する
  def follow!(following_user)
    user_id = get_user_id(following_user)
    following_relationships.create!(following_id: user_id)
  end

  def get_user_id(following_user)
    if following_user.is_a?(User)
      following_user.id
    else
      following_user
    end
  end
end

RSpec.describe "Api::Follows", type: :request do
  # include FollowsSpecHelper

  let!(:user) { create(:user) }
  let!(:following_user) { create(:user) }

  describe "GET /api/accounts/:account_id/follows" do
    it "200 Status" do
      post api_follows_path(account_id: following_user.id)
      # binding.pry
      expect(response).to have_http_status(200)
      body = JSON.parse(response.body)
    end
  end
end
