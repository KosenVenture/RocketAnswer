class AddOrderToAnswerFiles < ActiveRecord::Migration
  def change
    add_column :answer_files, :order, :integer
  end
end
