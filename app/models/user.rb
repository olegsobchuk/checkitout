class User < ActiveRecord::Base
  has_secure_password validations: false

  enum status: [:user, :admin]

  attr_accessor :skip_password_validation

  validates :email,
    uniqueness: true,
    presence: true,
    length: { minimum: 3, maximum: 254 },
    format: { with: /.+@.+\..+/i }
  validates :password, confirmation: true, presence: true, length: { minimum: 6 }, unless: :skip_password_validation
end
