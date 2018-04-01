class CreateUploadFile < ActiveRecord::Migration[5.1]
  def change
    create_table :upload_files do |t|
      t.references :fileable, polymorphic: true, index: true
    end
  end
end
