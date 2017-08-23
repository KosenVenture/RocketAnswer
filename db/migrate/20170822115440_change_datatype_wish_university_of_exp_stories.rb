class ChangeDatatypeWishUniversityOfExpStories < ActiveRecord::Migration[5.1]
  def change
  	def up
  		change_column :exp_stories, :wish_university, :reference
  	end

  	def down
  		change_column :exp_stories, :wish_university, :text
  	end
  end
end
