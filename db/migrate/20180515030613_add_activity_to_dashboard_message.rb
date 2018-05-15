class AddActivityToDashboardMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :dashboard_messages, :activity, :boolean, default: true
  end
end
