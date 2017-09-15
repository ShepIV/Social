class Post < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :destroy

  mount_uploader :image, ImageUploader

  acts_as_likeable
end
