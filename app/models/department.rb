class Department < ActiveRecord::Base

  ###### Association ######
  belongs_to :school
  has_many :answers,
    dependent: :nullify

  ###### Instance Method ######
  def full_name
    school.name + ' ' + name
  end
end
