require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:user) { create(:user) }
  let!(:snap) { build(:snap, user: user) }

  context 'コメントが入力されている場合' do
    let!(:comment) { build(:comment, snap: snap, user: user) }

    it '投稿を保存できる' do
      expect(comment).to be_valid
    end
  end
end
