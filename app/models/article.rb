class Article < ApplicationRecord
    def has_title()
        self.title.present?
    end
end
