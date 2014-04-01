class Subject < ActiveRecord::Base

  ###### Association ######
  belongs_to :department
  has_many :answers

  ###### Validation ######


  ###### Scope ######


  ###### Callback ######


  ###### Class Method ######


  ###### Instance Method ######

end
