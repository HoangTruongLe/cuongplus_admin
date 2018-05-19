class AddUnaccentedNameToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :unaccented_name, :string
  end
end
