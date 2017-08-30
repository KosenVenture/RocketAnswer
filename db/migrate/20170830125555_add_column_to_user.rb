class AddColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :grad_school, :string
    add_column :users, :grad_department, :string
    add_column :users, :max_rank, :int
  end
end
