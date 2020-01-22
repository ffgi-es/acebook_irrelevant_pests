class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true,
            format: { with: /\A([A-z0-9]+)(\.[A-z0-9]+|-[A-z0-9]+)*
                      @([A-z0-9]+)(\.[A-z0-9]+|-[A-z09]+)*\.[A-z]{2,3}/x }
  validates :password, length: { in: 6..10 }
  validates :password, confirmation: { case_sensitive: true }

  has_secure_password

  has_many :photos, dependent: :destroy
  has_many :posts, dependent: :destroy

  has_one_attached :profile_picture
end
