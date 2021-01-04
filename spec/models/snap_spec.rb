require 'rails_helper'

RSpec.describe Snap, type: :model do
  let!(:user) { create(:user) }

  context '説明が入力されている場合' do
    let!(:snap) { build(:snap, user: user) }

    it '投稿を保存できる' do
      expect(snap).to be_valid
    end
  end

  context '説明の文字が一文字の場合' do
    let!(:snap) { build(:snap, description: Faker::Lorem.characters(number: 1), user: user) }
  
    it '投稿を保存できる' do
      expect(snap).to be_valid
    end
  end
end
