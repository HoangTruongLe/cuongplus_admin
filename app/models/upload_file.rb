class UploadFile < ApplicationRecord
  belongs_to :fileable, polymorphic: true, optional: true

  has_attached_file :file,
  path: "app/files/:id/:filename"
  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :file, :less_than => 5.megabytes

  attr_accessor :file_url

  def file_url
    file.expiring_url
  end

end
