class CreateSuperDashboardMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :dashboard_messages do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
