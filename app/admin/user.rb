ActiveAdmin.register User do
  permit_params :nickname, :graduate_year, :first_name, :last_name, :school, :department,
  :email

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

  form do |f|
    f.semantic_errors

    f.inputs do
      f.input :nickname
      f.input :email
      f.input :last_name
      f.input :first_name
      f.input :school
      f.input :department
      f.input :graduate_year
    end

    f.actions
  end

  index do
    column :id
    column :nickname
    column :email
    column :school
    column :last_name
    column :first_name
    column :created_at
    column :current_sign_in_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :nickname
      row :email
      row :last_name
      row :first_name
      row :school
      row :department
      row :graduate_year
      row :created_at
      row :updated_at
      row :reset_password_sent_at
      row :remember_created_at
      row :sign_in_count
      row :current_sign_in_at
      row :last_sign_in_at
      row :current_sign_in_ip
      row :last_sign_in_ip
    end
  end
end
