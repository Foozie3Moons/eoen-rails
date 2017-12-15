class User < ApplicationRecord
  has_many :loan

  validates :first_name, :last_name,
    presence: true
  validates :email,
    presence: true,
    uniqueness: {
      case_sentitive: false
    }

  validates :password,
    length: { in: 7..33 },
    on: :create

  has_secure_password

  def self.authenticate(params)
    User.find_by_email(params[:email]).try(:authenticate, params[:password])
  end
end
