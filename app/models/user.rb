class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ###### Association ######
  belongs_to :school
  belongs_to :department
  has_many :wish_universities

  ###### Validation ######


  ###### Scope ######


  ###### Callback ######


  ###### Class Method ######


  ###### Instance Method ######
  def name
    last_name + ' ' + first_name
  end
end
