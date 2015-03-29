class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ###### Association ######
  has_many :wish_universities
  accepts_nested_attributes_for :wish_universities
  has_many :stocks, class_name: :AnswerStock
  has_many :stocked_answers,
    class_name: :Answer,
    through: :stocks,
    source: :answer

  ###### Validation ######
  validates :last_name, :first_name, :nickname,
    presence: true
  validates :last_name, :first_name, :nickname, :school, :department,
    length: { maximum: 20 }
  validates :nickname, uniqueness: true
  validates :graduate_year,
    numericality: { greater_than_or_equal_to: DateTime.now.year, less_than: 2100 },
    allow_blank: true

  ###### Scope ######


  ###### Callback ######


  ###### Class Method ######


  ###### Instance Method ######
  def name
    last_name + ' ' + first_name
  end
end
