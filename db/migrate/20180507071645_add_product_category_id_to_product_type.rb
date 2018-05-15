class AddProductCategoryIdToProductType < ActiveRecord::Migration[5.1]
  def change
    add_column :product_types, :product_category_id, :integer, default: ProductCategory.first.id
  end
end
