class User < ActiveRecord::Base
  has_many :questions
  has_many :comments

  validates_presence_of :username, :email
  validates :username, uniqueness: true
  validates :email, uniqueness: true

  has_secure_password
end
