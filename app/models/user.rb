class User < ActiveRecord::Base
  belongs_to :school
  belongs_to :department
  has_many :wish_universities
end
