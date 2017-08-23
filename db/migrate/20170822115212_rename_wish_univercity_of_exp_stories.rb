class RenameWishUnivercityOfExpStories < ActiveRecord::Migration[5.1]
  def change	
  	rename_column :exp_stories, :wish_univercity, :wish_university
  end
end
