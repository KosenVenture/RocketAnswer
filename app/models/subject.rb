class Subject < ActiveRecord::Base

  ###### Association ######
  belongs_to :department
  has_many :answers

  ###### Validation ######
  validates :name,
    presence: true,
    length: { maximum: 255 }

  ###### Scope ######


  ###### Callback ######


  ###### Class Method ######


  ###### Instance Method ######

end
