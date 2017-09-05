class RemoveSubjectIdOnAnswers < ActiveRecord::Migration[5.1]
  def change
    remove_column :answers, :subject_id
  end
end
