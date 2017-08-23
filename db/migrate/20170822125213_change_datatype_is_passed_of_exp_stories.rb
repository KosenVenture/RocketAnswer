class ChangeDatatypeIsPassedOfExpStories < ActiveRecord::Migration[5.1]
  def change
  	def up
  		change_column :exp_stories, :is_passed, :boolean, default: false, null: false
  	end

  	def down
  		change_column :exp_stories, :is_passed, :boolean
  	end
  end
end
