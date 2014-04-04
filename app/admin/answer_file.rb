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
    column :id
    column :answer_id do |answer_file|
      link_to answer_file.id, admin_answer_path(answer_file.answer)
    end
    column :image do |answer_file|
      image_tag(answer_file.image)
    end
    column :order
    column :created_at
    column :updated_at
    default_actions
  end

  show do |answer_file|
    attributes_table do
      row :id
      row :answer_id
      row :image do
        image_tag(answer_file.image)
      end
      row :order
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

end
