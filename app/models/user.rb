class User < ApplicationRecord

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_one :profile, dependent: :destroy
  # after_create :profile
  accepts_nested_attributes_for :profile, update_only: true

end
