class User < ApplicationRecord
  has_many :loan

  PASSWORD_FORMAT = /\A
    (?=.{8,})          # Must contain 8 or more characters
    (?=.*\d)           # Must contain a digit
    (?=.*[a-z])        # Must contain a lower case character
    (?=.*[A-Z])        # Must contain an upper case character
    (?=.*[[:^alnum:]]) # Must contain a symbol
  /x
  # Password format cortesy of Tom Lord
  # https://stackoverflow.com/questions/5123972/ruby-on-rails-password-validation

  validates :first_name, :last_name,
    presence: true
  validates :email,
    presence: true,
    uniqueness: {
      case_sentitive: false
    }

  validates :password,
    length: { in: 7..33 },
    format: { with: PASSWORD_FORMAT },
    on: :create

  has_secure_password

  def self.authenticate(params)
    User.find_by_email(params[:email]).try(:authenticate, params[:password])
  end
end
