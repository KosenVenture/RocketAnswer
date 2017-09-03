class AddColumnGradToExpStories < ActiveRecord::Migration[5.1]
  def change
    add_column :exp_stories, :grad_school, :string
    add_column :exp_stories, :grad_department, :string
  end
end
