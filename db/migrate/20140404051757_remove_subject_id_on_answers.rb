class RemoveSubjectIdOnAnswers < ActiveRecord::Migration
  def change
    remove_column :answers, :subject_id
  end
end
