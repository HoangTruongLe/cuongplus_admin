class AddDraftToProductType < ActiveRecord::Migration[5.1]
  def change
    add_column :product_types, :draft, :boolean, default: true
  end
end
