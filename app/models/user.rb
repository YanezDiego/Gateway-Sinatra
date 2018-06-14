class User < ActiveRecord::Base
  has_many :questions
  has_many :comments
end
