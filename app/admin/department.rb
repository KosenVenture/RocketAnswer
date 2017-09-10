ActiveAdmin.register Department do
  permit_params :school_id, :name, :kind, :prefecture, :address

  includes :school
end
