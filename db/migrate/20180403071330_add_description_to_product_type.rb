class AddDescriptionToProductType < ActiveRecord::Migration[5.1]
  def change
    add_column :product_types, :description, :text
  end
end
