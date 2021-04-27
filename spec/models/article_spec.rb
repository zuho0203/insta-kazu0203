require 'rails_helper'

RSpec.describe Article, type: :model do
  let!(:user) { create(:user) }

  context 'contentが1文字以上140字以内で入力されている場合' do
    let!(:article) { build(:article, user: user) }

    it '記事を保存できる' do
      expect(article).to be_valid
    end
  end

  context 'contentが1文字以上140字以内で入力され、画像が投稿される場合' do
    let!(:article) { build(:article, user: user) }

    before do
      article.portraits = fixture_file_upload('spec/fixtures/test.png')
    end

    it '記事を保存できる' do
      expect(article).to be_valid
    end
  end

  context 'contentが入力されていない場合' do
    let!(:article) { build(:article, content: Faker::Lorem.characters(number: 0), user: user) }

    before do
      article.save
    end

    it '記事を保存できない' do
      expect(article.errors.messages[:content][0]).to eq("can't be blank")
    end
  end

  context 'contentが141文字以上入力されている場合' do
    let!(:article) { build(:article, content: Faker::Lorem.characters(number: 141), user: user) }

    before do
      article.save
    end

    it '記事を保存できない' do
      expect(article.errors.messages[:content][0]).to eq("is too long (maximum is 140 characters)")
    end
  end
end