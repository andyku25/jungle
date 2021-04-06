class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  before_save :trim_to_lower

  def trim_to_lower
    self.email.downcase!
    self.email.strip!
  end

  def self.authenticate_with_credentials(email, password)
    email.downcase!
    email.strip!

    @user = User.find_by(email: email)

    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end
end
