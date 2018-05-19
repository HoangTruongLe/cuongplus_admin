class ProductCategory < ApplicationRecord
  include Utility
  extend FriendlyId
  friendly_id :unaccented_name, :use => [:slugged, :finders]
  
  before_save :remove_accent_on_name
  
  
  has_many :product_types, :dependent => :destroy
  
  scope :active, -> { where(activity: true) }
  scope :order_by_position, -> { order(position: :asc) }
  
  ACTIVITY = [['Hoạt động', true] ,['Không hoạt động', false]]
  
  def products
    Product.where(product_type_id: product_types.pluck(:id))
  end
  
  def products_by_type type_id
    Product.where(product_type_id: type_id)
  end
  
  def to_param_like
    remove_accent(name).parameterize
  end
  
  def remove_accent_on_name
    self.unaccented_name = remove_accent(name) if name
  end
    
end
