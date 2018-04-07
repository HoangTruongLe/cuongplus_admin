class Product < ApplicationRecord
  belongs_to :product_type
  has_many :upload_files, as: :fileable, :dependent => :destroy
  accepts_nested_attributes_for :upload_files, reject_if: :all_blank, allow_destroy: true

  scope :with_name_like, -> (q) { where('name LIKE ?', "%#{q}%") }
  scope :is_draft, -> { where(draft: true) }
  scope :is_not_draft, -> { where(draft: false) }
  scope :with_price_like, -> (q) { where('price LIKE ?', "%#{q}%") }
  scope :with_type_like, -> (q) { joins(:product_type).where('lower_unaccent(product_types.name) ILIKE lower_unaccent(?)', "%#{q}%") }
  # scope :with_type_like, -> (q) { joins(:product_type).where('product_types.name ILIKE ?', "%#{q}%") }

  enum status: [:available, :unavailable, :waiting]
  STATUS = [[:available, 'Available'] ,[:unavailable, 'Unavailable'], [:waiting, 'Waiting']]

  ransacker :price do
    Arel.sql("to_char(\"#{table_name}\".\"price\", '99999999')")
  end

  ransacker :id do
    Arel.sql("to_char(\"#{table_name}\".\"id\", '99999999')")
  end
end
