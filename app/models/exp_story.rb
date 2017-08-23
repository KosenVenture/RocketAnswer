class ExpStory < ApplicationRecord
  extend Enumerize
  ###### Association ######
  belongs_to :department
  delegate :school, to: :department
  belongs_to :user

  ###### Validation ######
  validates :year, presence: true,
    numericality: { greater_than: 1900, less_than_or_equal_to: DateTime.now.year }
  enumerize :way, in: [:ippan, :suisen]

end
