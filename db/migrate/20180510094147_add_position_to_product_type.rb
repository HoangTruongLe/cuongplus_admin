class AddPositionToProductType < ActiveRecord::Migration[5.1]
  def change
    add_column :product_types, :position, :integer
  end
end
