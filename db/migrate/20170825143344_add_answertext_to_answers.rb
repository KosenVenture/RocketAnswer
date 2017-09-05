class AddAnswertextToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :answer_text, :text
  end
end
