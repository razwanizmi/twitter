class User < ActiveRecord::Base
  validates_length_of :description, maximum: 140, message: "Tweets must not exceed 140 characters", on: :create
  belongs_to :user
end