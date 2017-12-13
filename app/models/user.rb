class User < ApplicationRecord
  has_many :loan

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
end
