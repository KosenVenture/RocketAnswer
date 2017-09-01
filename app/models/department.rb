class Department < ActiveRecord::Base

  ###### Association ######
  belongs_to :school
  has_many :answers,
    dependent: :nullify
  has_many :exp_stories

  ###### Instance Method ######
  def full_name
    school.name + ' ' + name
  end
end
