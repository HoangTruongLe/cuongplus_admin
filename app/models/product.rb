class Product < ApplicationRecord
  belongs_to :product_type
  has_many :upload_files, as: :fileable, :dependent => :destroy
  accepts_nested_attributes_for :upload_files, reject_if: :all_blank, allow_destroy: true
end
