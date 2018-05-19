class AddSlugToDashboardMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :dashboard_messages, :slug, :string
    add_index :dashboard_messages, :slug, unique: true
  end
end
