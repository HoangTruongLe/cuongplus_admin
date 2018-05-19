class AddAvatarToProductType < ActiveRecord::Migration[5.1]
  def up
    add_attachment :product_types, :avatar
  end

  def down
    remove_attachment :product_types, :avatar
  end
end
