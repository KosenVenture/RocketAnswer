class CreateAnswerStocks < ActiveRecord::Migration
  def change
    create_table :answer_stocks do |t|
      t.references :answer, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
