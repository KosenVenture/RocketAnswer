class CreateExpStories < ActiveRecord::Migration[5.1]
  def change
    create_table :exp_stories do |t|
      t.boolean :is_passed, default: false, null: false
      t.integer :year
      t.text :self_intro
      t.text :advice
      t.text :motivation
      t.text :exam
      t.text :interview
      t.text :textbook
      t.string :way
      t.string :grad_school
      t.string :grad_department
      t.references :department, foreign_key: true, index: true
      t.references :user,       foreign_key: true, index: true

      t.timestamps
    end
  end
end
