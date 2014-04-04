class Department < ActiveRecord::Base
  belongs_to :school
  has_many :answers,
    dependent: :restrict # 投稿がある場合削除できない
end
