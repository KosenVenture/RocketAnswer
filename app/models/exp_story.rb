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
  validates :advice, presence: true
  validates :self_intro, presence: true
  validates :motivation, presence: true
  validates :way, presence: true
  validates :exam, presence: true
  validates :interview, presence: true
  validates :is_passed, inclusion: {in: [true, false]}
  validates :grad_school, presence: true
  validates :grad_department, presence: true
  enumerize :way, in: [:ippan, :suisen]

  ###### Instance Method ######
  def name
    if "#{way}" == "ippan"
      "一般（#{year}年）"
    else
      "推薦（#{year}年）"
    end
  end

end
