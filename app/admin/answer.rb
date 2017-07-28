ActiveAdmin.register Answer do
  permit_params :user_id, :year, :department_id, :subject
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  index do
    id_column
    column :user
    column :full_name
    column :created_at
    actions
  end

  show do |answer|
    attributes_table do
      row :id
      row :user
      row :full_name
      row :school
      row :department
      row :created_at
      row :updated_at
    end

    panel 'ファイル一覧' do
      table_for answer.answer_files do |answer_file|
        column :id do |answer_file|
          link_to answer_file.id, admin_answer_file_path(answer_file)
        end
        column :order
        column :image do |answer_file|
          link_to('開く', answer_file.image.url, target: '_blank')
        end
      end
    end

    panel 'コメント一覧' do
      table_for answer.comments do |comment|
        column :id
        column :content
      end
    end
  end
end
