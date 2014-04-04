class ChangeColumnOnUsers < ActiveRecord::Migration
  def change
    remove_column :users, :school_id
    remove_column :users, :department_id
    add_column :users, :school, :string
    add_column :users, :department, :string
    add_index :users, :school
    add_index :users, :department
  end
end
