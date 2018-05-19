class AddUnaccentedNameToProductCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :product_categories, :unaccented_name, :string
  end
end
