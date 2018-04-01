class AddAttachmentFileToUploadFiles < ActiveRecord::Migration[5.1]
  def self.up
    change_table :upload_files do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :upload_files, :file
  end
end
