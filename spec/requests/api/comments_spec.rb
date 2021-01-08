require 'rails_helper'

RSpec.describe "Api::Comments", type: :request do
  let!(:user) { create(:user) }
  let!(:snap) { build(:snap, user: user) }
  let!(:comment) { build(:comment, snap: snap, user: user) }
  
  describe "GET /api/comments" do
    context 'ログインしている場合' do
      it "200 Status" do
        get api_comments_path(snap_id: snap.id)
        expect(response).to have_http_status(200)
      end
    end
  end
end
