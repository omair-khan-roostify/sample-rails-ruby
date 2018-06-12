# frozen_string_literal: true

class Article < ApplicationRecord
  def title?
    title.present?
  end

  # Test Rails Best Practices warning (remove unused methods)
  def unused_method
    has_title
    too_many
  end

  # Test Rubocop warning (Naming/PredicateName)
  def has_title
    true
  end

  # Test reek warning (TooManyStatements)
  def too_many
    sample_method
    sample_method
    sample_method
    sample_method
    sample_method
    sample_method
    sample_method
    sample_method
    sample_method
    sample_method
    sample_method
    sample_method
    sample_method
  end
end
