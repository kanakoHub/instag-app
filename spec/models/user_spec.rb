require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "ユーザー作ると" do
    let!(:user) { create(:user) }

    it "保存できる" do
      expect(user).to be_valid
    end
  end
end
