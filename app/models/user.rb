class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ###### Association ######
  belongs_to :school
  belongs_to :department
  has_many :wish_universities
  accepts_nested_attributes_for :wish_universities

  ###### Validation ######
  validates :first_name, :last_name, :nickname,
    presence: true


  ###### Scope ######


  ###### Callback ######


  ###### Class Method ######


  ###### Instance Method ######
  def name
    last_name + ' ' + first_name
  end
end
