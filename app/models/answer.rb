class Answer < ActiveRecord::Base
  attr_accessor :university_id
  ###### Association ######
  belongs_to :department
  delegate :school, to: :department
  belongs_to :user
  has_many :answer_files, dependent: :destroy
  accepts_nested_attributes_for :answer_files
  has_many :comments, dependent: :destroy
  has_many :stocks, class_name: :AnswerStock
  has_many :stocking_users,
    class_name: :User,
    through: :stocks,
    source: :user


  ###### Validation ######
  validates :exam_url, {
    url: => {:allow_blank => true}
  }
  validates :subject, presence: true, length: { maximum: 20 }
  validates :year, presence: true,
    numericality: { greater_than: 1900, less_than_or_equal_to: DateTime.now.year }
  validates :department_id,
    presence: true

  ###### Scope ######
  default_scope -> { order('created_at DESC') }


  ###### Callback ######


  ###### Class Method ######


  ###### Instance Method ######
  def name
    "#{subject}（#{year}年）"
  end

  def full_name
    "#{school.name} #{department.name} #{subject}（#{year}年）"
  end

  # ストックしているかどうか
  def stocked?(user)
    # 該当ユーザのstocksが存在するか
    @stocked ||= self.stocks.where(user_id: user.id).exists?
  end

  # ストック数
  def stocked_count
    @stocked_count ||= self.stocks.count
  end
end
