class AddColumnToExpStory < ActiveRecord::Migration[5.1]
  def change
    add_reference :exp_stories, :department, index: true
  end
end
