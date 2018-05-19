class Product < ApplicationRecord
  include ScopingConcern
  include Utility
  extend FriendlyId
  friendly_id :unaccented_name, :use => [:slugged, :finders]
  
  before_save :remove_accent_on_name
  
  belongs_to :product_type, optional: true
  has_many :upload_files, as: :fileable, :dependent => :destroy
  accepts_nested_attributes_for :upload_files, reject_if: :all_blank, allow_destroy: true

  scope :with_name_like, -> (q) { where('name LIKE ?', "%#{q}%") }
  scope :is_draft, -> { where(draft: true) }
  scope :is_not_draft, -> { where(draft: false) }
  scope :with_price_like, -> (q) { where('price LIKE ?', "%#{q}%") }
  scope :with_type_like, -> (q) { joins(:product_type).where('lower_unaccent(product_types.name) ILIKE lower_unaccent(?)', "%#{q}%") }
  scope :search_order, -> { order("created_at desc, updated_at desc") }
  scope :order_by_position, -> { order(position: :asc) }
  scope :instalment, -> { where('instalment > 0') }
  
  enum status: [:available, :unavailable, :waiting, :sold]
  STATUS = [[:available, 'Available'] ,[:unavailable, 'Unavailable'], [:waiting, 'Waiting'], [:sold, 'Sold']]
  SEARCHING_COLUMNS = [:name, :description]

  ransacker :price do
    Arel.sql("to_char(\"#{table_name}\".\"price\", '99999999')")
  end

  ransacker :id do
    Arel.sql("to_char(\"#{table_name}\".\"id\", '99999999')")
  end
  
  def self.search word
    word = "%#{word}%"
    query = SEARCHING_COLUMNS.collect{|col| " lower_unaccent(#{col}) ILIKE lower_unaccent(?)" }.join(" OR ")
    where([query, [word] * SEARCHING_COLUMNS.size].flatten).search_order
  end
  
  def to_param_like
    remove_accent(name).parameterize
  end
  
  def remove_accent_on_name
    self.unaccented_name = remove_accent(name) if name
  end
end
