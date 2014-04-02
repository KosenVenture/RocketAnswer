class AnswerFile < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  mount_uploader :image, AnswerFileUploader

  ###### Association ######
  belongs_to :answer
  belongs_to :user

  ###### Validation ######


  ###### Scope ######


  ###### Callback ######


  ###### Class Method ######


  ###### Instance Method ######
  def to_jq_upload
    {
      "name" => read_attribute(:image),
      "size" => image.size,
      "url" => image.url,
      "delete_url" => admin_subject_answer_answer_file_path(self.answer.subject, self.answer, self),
      "delete_type" => "DELETE"
    }
  end
end
