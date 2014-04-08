class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer

  validates :content,
    presence: true,
    length: { maximum: 140 }
end
