class Product < ApplicationRecord
  belongs_to :product_type
  has_many :upload_files, as: :fileable, :dependent => :destroy
  accepts_nested_attributes_for :upload_files, reject_if: :all_blank, allow_destroy: true

  scope :with_name_like, -> (q) { where('name LIKE ?', "%#{q}%") }
  scope :with_price_like, -> (q) { where('price LIKE ?', "%#{q}%") }
  scope :with_type_like, -> (q) { includes(:product_type).where('product_types.name LIKE ?', "%#{q}%") }


  ransacker :price do
    Arel.sql("to_char(\"#{table_name}\".\"price\", '99999999')")
  end

  ransack_alias :typename, :product_types_name
end
