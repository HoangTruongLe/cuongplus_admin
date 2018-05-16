class AddUnaccentedNameToProductType < ActiveRecord::Migration[5.1]
  def change
    add_column :product_types, :unaccented_name, :string
  end
end
