class CreateDepartments < ActiveRecord::Migration[5.1]
  def change
    create_table :departments do |t|
      t.references :school, index: true
      t.string :name
      t.string :kind
      t.string :prefecture
      t.string :address

      t.timestamps
    end

    add_index :departments, :kind
    add_index :departments, :prefecture
  end
end
