class User < ApplicationRecord

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :posted_posts, dependent: :destroy, class_name: 'Post', foreign_key: 'author_id'

  accepts_nested_attributes_for :profile, update_only: true
  acts_as_follower
  acts_as_followable
  acts_as_liker
end
