class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :type
      t.string :establishment
      t.string :name

      t.timestamps
    end

    add_index :schools, :type
    add_index :schools, :establishment
    add_index :schools, :name
  end
end
