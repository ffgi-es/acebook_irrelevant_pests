class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, 
            format: { with: /\A([A-z0-9]+)(\.[A-z0-9]+|-[A-z0-9]+)*
                      @([A-z0-9]+)(\.[A-z0-9]+|-[A-z09]+)*\.[A-z]{2,3}/x }
  validates :password, length: { in: 6..10 }

  has_secure_password
end
