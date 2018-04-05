class AddInstalmentToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :instalment, :integer
  end
end
