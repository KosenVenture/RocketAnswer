class Answer < ActiveRecord::Base

  ###### Association ######
  belongs_to :department
  belongs_to :user
  has_many :answer_files,
    dependent: :destroy
  accepts_nested_attributes_for :answer_files

  ###### Validation ######
  validates :department_id, :subject, :year,
    presence: true

  ###### Scope ######


  ###### Callback ######


  ###### Class Method ######


  ###### Instance Method ######
  def name
    "#{subject}（#{year}年）"
  end
end
