class University < School
  has_many :answers,
    through: :departments
  scope :answer_exists,
    -> { joins(:answers).uniq }
end
