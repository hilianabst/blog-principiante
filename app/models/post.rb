class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    validates :image_url, presence: true

    before_save :sense_word

    def sense_word
    self.content = self.content.upcase.gsub "SPOILER", ""
    end 
end
