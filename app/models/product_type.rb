class ProductType < ApplicationRecord
  include ScopingConcern
  extend FriendlyId
  friendly_id :unaccented_name, :use => [:slugged, :finders]
  
  belongs_to :product_category, optional: true
  has_many :products, :dependent => :destroy
  has_many :upload_files, as: :fileable, :dependent => :destroy
  
  has_attached_file :avatar, 
    styles: { medium: "300x300>", thumb: "100x100>", sz1: "390x450", small_thumb: "50x50" },
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :avatar, :less_than => 5.megabytes
  
  accepts_nested_attributes_for :upload_files, reject_if: :all_blank, allow_destroy: true
  scope :with_name_like, -> (q) { where('name LIKE ?', "%#{q}%") }
  
  scope :order_by_position, -> { order(position: :asc) }
  
  ransacker :id do
    Arel.sql("to_char(\"#{table_name}\".\"id\", '99999999')")
  end
  
  def to_param_like
    remove_accent(name).parameterize
  end
  
  def s3_path(style = nil)
    avatar.s3_object(style).presigned_url("get", expires_in: 100) if avatar.exists?
  end
  
  def remove_accent_on_name
    self.unaccented_name = remove_accent(name) if name
  end
  
end
