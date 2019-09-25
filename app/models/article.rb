class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_and_belongs_to_many :tags
    validates :title, presence: true,
                      length: {minmum: 5, maximum: 255}
end
