class CreateWishUniversities < ActiveRecord::Migration
  def change
    create_table :wish_universities do |t|
      t.references :user, index: true
      t.references :university, index: true
      t.references :department, index: true
      t.integer :rank

      t.timestamps
    end

    add_index :wish_universities,
     [:user_id, :university_id, :department_id],
     unique: true,
     name: 'wish_universities_uniquness'
  end
end
