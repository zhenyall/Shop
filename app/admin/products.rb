ActiveAdmin.register Product do
  permit_params :title, :description, :price, :category_id

  show do
    product
  end
  
end
