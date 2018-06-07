require 'rails_helper'

RSpec.describe Article, type: :model do
  describe `has_title` do
    context 'article has title' do
      it 'returns true' do
        article = Article.create!(title: "sample")
        expect(article.has_title).to be true
      end
    end
    context 'article has not title' do
      it 'returns false' do
        article = Article.create!
        expect(article.has_title).to be false
      end
    end
  end
end
