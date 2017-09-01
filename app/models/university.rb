class University < School
  has_many :answers,
    through: :departments
  has_many :exp_stories,
  	through: :departments
  scope :answer_exists,
    -> { joins(:answers).uniq }
end
