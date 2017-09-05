class DropSubjectsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :subjects
  end
end
