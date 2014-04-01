class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :nickname
      t.string :email
      t.references :school, index: true
      t.references :department, index: true
      t.integer :graduate_year

      t.timestamps
    end
  end
end
