class Post < ApplicationRecord
    validates_presence_of :title, :content, :image_url

    before_save :sense_word

    def sense_word
    self.content = self.content.upcase.gsub "SPOILER", ""
    end 
end
