class Answer < ActiveRecord::Base

  ###### Association ######
  belongs_to :department
  delegate :school, to: :department
  belongs_to :user
  has_many :answer_files, dependent: :destroy
  accepts_nested_attributes_for :answer_files
  has_many :comments, dependent: :destroy

  ###### Validation ######
  validates :subject, presence: true, length: { maximum: 20 }
  validates :year, presence: true,
    numericality: { greater_than: 1900, less_than_or_equal_to: DateTime.now.year } 

  ###### Scope ######
  default_scope -> { order('created_at DESC') }


  ###### Callback ######


  ###### Class Method ######


  ###### Instance Method ######
  def name
    "#{subject}（#{year}年）"
  end

  def full_name
    "#{school.name} #{department.name} #{subject}（#{year}年）"
  end
end
