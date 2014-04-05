class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ###### Association ######
  has_many :wish_universities
  accepts_nested_attributes_for :wish_universities

  ###### Validation ######
  validates :last_name, :first_name, :nickname, :school, :department,
    presence: true, length: { maximum: 20 }
  validates :nickname, uniqueness: true
  validates :graduate_year, presence: true,
    numericality: { greater_than_or_equal_to: DateTime.now.year, less_than: 2100 }

  ###### Scope ######


  ###### Callback ######


  ###### Class Method ######


  ###### Instance Method ######
  def name
    last_name + ' ' + first_name
  end
end
