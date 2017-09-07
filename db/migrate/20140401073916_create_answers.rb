class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.references :subject, index: true
      t.references :user, index: true
      t.integer :year

      t.timestamps
    end
  end
end
