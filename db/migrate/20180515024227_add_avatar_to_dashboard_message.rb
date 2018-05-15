class AddAvatarToDashboardMessage < ActiveRecord::Migration[5.1]
  def up
    add_attachment :dashboard_messages, :avatar
  end

  def down
    remove_attachment :dashboard_messages, :avatar
  end
end
