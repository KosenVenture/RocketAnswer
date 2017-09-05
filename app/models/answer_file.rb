class AnswerFile < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  mount_uploader :image, AnswerFileUploader

  ###### Association ######
  belongs_to :answer
  belongs_to :user

  ###### Validation ######
  validates :image, presence: true


  ###### Scope ######
  default_scope -> { order('`order`') }

  ###### Callback ######
  before_create do |obj|
    last_num = obj.answer.answer_files.last.try(:order) if obj.answer
    obj.order = last_num ? last_num + 1 : 0
  end


  ###### Class Method ######


  ###### Instance Method ######
  def to_jq_upload
    {
      "name" => read_attribute(:image),
      "size" => image.size,
      "url" => image.url,
      "delete_url" => answer_answer_file_path(answer_id: self.answer.id, id: self.id),
      "delete_type" => "DELETE"
    }
  end

  def is_pdf?
    ext = image.file.filename.split('.').last
    ext == 'pdf' || ext == 'PDF'
  end
end
