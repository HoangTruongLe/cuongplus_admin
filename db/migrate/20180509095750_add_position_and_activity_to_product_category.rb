class AddPositionAndActivityToProductCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :product_categories, :position, :integer
    add_column :product_categories, :activity, :boolean, default: true
  end
end
