require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:user) { create(:user) }

  context 'commentが1文字以上70字以内で入力されている場合' do
    let!(:comment) { build(:comment, user: user) }

    it '記事を保存できる' do
      expect(article).to be_valid
    end
  end
end
