class RemoveColumnFromExpStories < ActiveRecord::Migration[5.1]
  def change
    remove_column :exp_stories, :graduated_school, :text
    remove_column :exp_stories, :graduated_department, :text
    remove_column :exp_stories, :max_rank, :int
  end
end
