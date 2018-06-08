# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  describe `title?` do
    context 'when article has title' do
      it 'returns true' do
        article = Article.create!(title: 'sample')
        expect(article.title?).to be true
      end
    end
    context 'when article has not title' do
      it 'returns false' do
        article = Article.create!
        expect(article.title?).to be false
      end
    end
  end
end
