class AddColumnsToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :department_id, :integer
    add_column :answers, :subject, :string
  end
end
