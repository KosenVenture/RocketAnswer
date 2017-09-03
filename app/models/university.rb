class University < School
  has_many :answers,
    through: :departments
  has_many :exp_stories,
  	through: :departments

    scope :answer_exists, -> {
        where(id: Answer.joins(:department).select('departments.school_id').reorder(''))
        .or(
          where(id: ExpStory.joins(:department).select('departments.school_id').reorder(''))
        )
      }
end
