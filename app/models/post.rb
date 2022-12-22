class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :goods, dependent: :destroy
  belongs_to :user
end
