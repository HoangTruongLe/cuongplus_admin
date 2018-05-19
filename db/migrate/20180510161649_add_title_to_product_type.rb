class AddTitleToProductType < ActiveRecord::Migration[5.1]
  def change
    add_column :product_types, :title, :string
  end
end
