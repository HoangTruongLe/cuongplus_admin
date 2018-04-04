class UploadFile < ApplicationRecord
  belongs_to :fileable, polymorphic: true, optional: true
  has_attached_file :file, styles: { medium: "360x240>", thumb: "100x100>" },
  default_url: "/images/:style/missing.png"
  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :file, :less_than => 5.megabytes

  attr_accessor :file_url

  def file_url
    file.expiring_url
  end

  def s3_path(style = nil)
    file.s3_object(style).presigned_url("get", expires_in: 100)
  end

  def s3_download_path
    file.s3_object.presigned_url("get", expires_in: 100)
  end

end
