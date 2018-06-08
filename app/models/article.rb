# frozen_string_literal: true

class Article < ApplicationRecord
  def title?
    title.present?
  end
end
