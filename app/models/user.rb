class User < ActiveRecord::Base
  validates :username, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true
  validates_format_of :email, :with => /[^@\s]+[@]+[^@\s]+[.]+[^@\s]+/, :on => :create, message: "User email is not in proper format"
  validates_length_of :password, minimum: 5, message: "Password must be more than 5 characters"
  has_many :tweets
  has_secure_password
end