class AddUnaccentedTitleToDashboardMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :dashboard_messages, :unaccented_title, :string
  end
end
