class Department < ActiveRecord::Base
  belongs_to :school
  has_many :subjects,
    dependent: :destroy
end
