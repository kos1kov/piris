class Post < ApplicationRecord
  has_many :comments
  #presence - автоматический вызов
  validates :title, presence: true, length: {minimum: 5}
end
