require 'rails_helper'

RSpec.describe "Api::Likes", type: :request do
  let!(:user) { create(:user) }
  let!(:snap) { create(:snap, user: user) }

  describe "POST /api/snaps/:snap_id/like" do
    context 'ログインしている場合' do
      before do
        sign_in user
      end

      it "200 Status" do
        post api_like_path(snap_id: snap.id)
        expect(response).to have_http_status(200)
        body = JSON.parse(response.body)
        expect(body['status']).to eq "ok"
      end
    end
  end

  # describe "DELETE /api/snaps/:snap_id/like" do
  #   context 'ログインしている場合' do
  #     before do
  #       sign_in user
  #     end
      
  #     it "200 Status" do
  #       like = Like.new(user_id: user.id,  snap_id: snap.id)
  #       delete api_like_path(snap_id: snap.id)
  #       binding.pry
  #       expect(response).to have_http_status(200)
  #       body = JSON.parse(response.body)
  #       expect(body['status']).to eq "ok"
  #     end
  #   end
  # end
end
