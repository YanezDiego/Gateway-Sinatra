class User < ActiveRecord::Base
  has_many :questions
  has_many :comments

  validates_presence_of :ussername, :email

  has_secure_password
end
