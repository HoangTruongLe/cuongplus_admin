class AddDraftToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :draft, :boolean, default: true
  end
end
