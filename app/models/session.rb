class Session < VirtualModel
  attr_accessor :email, :password

  delegate :id, :type, to: :user, prefix: true

  validates :email, :password, presence: true
  validate :credentials, unless: -> { password.blank? }

  def user
    @user ||= User.find_by_email(email.downcase)
  end

  private

  def credentials
    errors.add(:email, :invalid) && return if user.nil?
    errors.add(:password, 'Password not confirmed') && return if user.password_digest.nil?
    errors.add(:password, :invalid) unless user.authenticate(password)
  end
end
