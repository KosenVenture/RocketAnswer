class Contact
  include ActiveModel::Model

  # フィールド
  attr_accessor :name, :email, :body, :accept

  # 必須項目
  validates :name, :email,
    presence: true

  # 文字量制限
  validates :name,
    length: { maximum: 50 }
  validates :email,
    length: { maximum: 256 }
  validates :body,
    length: { minimum: 10, maximum: 3000 }
  validates :accept,
    acceptance: true

  # メールアドレスの不正な形式をはじく
  validate :email_valid?

  private

  def email_valid?
    unless email =~ /^([^@\s]+)[^.]@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i && email !~ /[.]{2}/
      errors.add(:email, 'は不正な形式のメールアドレスです。')
    end
  end
end
