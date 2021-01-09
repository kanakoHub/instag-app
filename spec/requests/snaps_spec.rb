require 'rails_helper'

RSpec.describe "Snaps", type: :request do
  let!(:user) { create(:user) }
  let!(:snap) { create(:snap, user: user) }
  let!(:comment) { create(:comment, snap: snap, user: user) }
  
  describe "GET /snaps" do
    it "200ステータスが返ってくる" do
      get snaps_path
      expect(response).to have_http_status(200)
    end
  end
  
  describe "POST /snaps" do
    context 'ログインしている場合' do
      before do
        sign_in user
      end
      
      it "記事が保存される" do
        snap_params = attributes_for(:snap)
        post snaps_path({snap: snap_params})
        expect(response).to have_http_status(302)
        expect(Snap.last.description).to eq(snap_params[:description])
      end  
    end
    
    context 'ログインしていない場合' do
      it "ログイン画面に遷移する" do
        snap_params = attributes_for(:snap)
        post snaps_path({snap: snap_params})
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
  
  describe "GET /snaps/:id" do
    context 'ログインしている場合' do
      before do
        sign_in user
      end
      
      it "200ステータスが返ってくる" do
        get snap_path(id: snap.id)
        expect(response).to have_http_status(200)
      end  
    end
    
    context 'ログインしていない場合' do
      it "ログイン画面に遷移する" do
        get snap_path(id: snap.id)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
