class RemoveColumnFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :max_rank, :integer
    remove_column :users, :grad_school, :string
    remove_column :users, :grad_department, :string
  end
end
