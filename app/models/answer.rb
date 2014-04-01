class Answer < ActiveRecord::Base

  ###### Association ######
  belongs_to :subject
  belongs_to :user
  has_many :answer_files,
    dependent: :destroy

  ###### Validation ######


  ###### Scope ######


  ###### Callback ######


  ###### Class Method ######


  ###### Instance Method ######

end
