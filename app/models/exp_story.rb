class ExpStory < ApplicationRecord
  extend Enumerize
  attr_accessor :university_id

  ###### Association ######
  belongs_to :department
  delegate :school, to: :department
  belongs_to :user

  ###### Validation ######
  validates :year, presence: true,
    numericality: { greater_than: 1900, less_than_or_equal_to: DateTime.now.year }
  validates :self_intro,
    presence: true,
    length: { minimum: 50, maximum: 10000 }
  validates :motivation,
    presence: true,
    length: { minimum: 50, maximum: 10000 }
  validates :exam,
    presence: true,
    length: { maximum: 10000 }
  validates :interview,
    presence: true,
    length: { maximum: 10000 }
  validates :advice,
    presence: true,
    length: { minimum: 10, maximum: 10000 }
  validates :way, presence: true
  validates :is_passed, inclusion: {in: [true, false]}
  validates :grad_school, presence: true, length: { maximum: 30 }
  validates :grad_department, presence: true, length: { maximum: 30 }
  enumerize :way, in: [:ippan, :suisen]

  ###### Instance Method ######
  def name
    "#{way_text}（#{year}年）"
  end

  def full_name
    "#{school.name} #{department.name} #{way_text}（#{year}年）"
  end

  def is_passed_text
    is_passed ? '合格' : '不合格'
  end
end
