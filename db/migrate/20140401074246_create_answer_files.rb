class CreateAnswerFiles < ActiveRecord::Migration
  def change
    create_table :answer_files do |t|
      t.references :answer, index: true
      t.references :user, index: true
      t.string :image

      t.timestamps
    end
  end
end
