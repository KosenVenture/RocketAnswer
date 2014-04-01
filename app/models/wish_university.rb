class WishUniversity < ActiveRecord::Base
  belongs_to :user
  belongs_to :university
  belongs_to :department
end
