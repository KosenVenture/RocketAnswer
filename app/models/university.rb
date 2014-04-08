class University < School
  has_many :answers,
    through: :departments
end
