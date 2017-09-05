class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.references :department, index: true
      t.string :name

      t.timestamps
    end
  end
end
