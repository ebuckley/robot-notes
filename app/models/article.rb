class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
    validates :title, presence: true,
                      length: {minmum: 5, maximum: 255}
end
