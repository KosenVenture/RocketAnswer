class CreateExpStories < ActiveRecord::Migration[5.1]
  def change
    create_table :exp_stories do |t|
      t.text :advice

      t.timestamps
    end
  end
end
