ActiveAdmin.register AnswerFile do
  permit_params :answer_id, :user_id, :image, :order

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
    column :answer do |answer_file|
      link_to answer_file.answer.full_name, admin_answer_path(answer_file.answer)
    end
    column :image do |answer_file|
      link_to('開く', answer_file.image.url, target: '_blank')
    end
    column :user
    column :created_at
    actions
  end

  show do |answer_file|
    attributes_table do
      row :id
      row :user
      row :answer do
        link_to answer_file.answer.full_name, admin_answer_path(answer_file.answer)
      end
      row :image do
        link_to image_tag(answer_file.image, width: 400), answer_file.image.url, target: '_blank'
      end
      row :order
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
