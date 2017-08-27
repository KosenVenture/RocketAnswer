class AddUserRefToExpStories < ActiveRecord::Migration[5.1]
  def change
    add_reference :exp_stories, :user, foreign_key: true
  end
end
