class AddColumnsToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :department_id, :integer
    add_column :answers, :subject, :string
  end
end
