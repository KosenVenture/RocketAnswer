class AddOrderToAnswerFiles < ActiveRecord::Migration[5.1]
  def change
    add_column :answer_files, :order, :integer
  end
end
