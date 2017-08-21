class AddUrlToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :exam_url, :text
  end
end
