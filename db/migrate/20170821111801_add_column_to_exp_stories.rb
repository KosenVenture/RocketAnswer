class AddColumnToExpStories < ActiveRecord::Migration[5.1]
  def change
    add_column :exp_stories, :is_passed, :boolean
    add_column :exp_stories, :year, :integer
    add_column :exp_stories, :self_intro, :text
    add_column :exp_stories, :motivation, :text
    add_column :exp_stories, :exam, :text
    add_column :exp_stories, :interview, :text
    add_column :exp_stories, :textbook, :text
    add_column :exp_stories, :wish_univercity, :text
    add_column :exp_stories, :graduated_school, :text
    add_column :exp_stories, :graduated_department, :text
    add_column :exp_stories, :max_rank, :integer
  end
end
