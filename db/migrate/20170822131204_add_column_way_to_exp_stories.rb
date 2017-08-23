class AddColumnWayToExpStories < ActiveRecord::Migration[5.1]
  def change
  	add_column :exp_stories, :way, :integer
  end
end
