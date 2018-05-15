class ProductCategory < ApplicationRecord
  include Utility
  has_many :product_types, :dependent => :destroy
  
  scope :active, -> { where(activity: true) }
  scope :order_by_position, -> { order(position: :asc) }
  
  ACTIVITY = GENDER = [['Hoạt động', true] ,['Không hoạt động', false]]
  
  def products
    Product.where(product_type_id: product_types.pluck(:id))
  end
  
  def products_by_type type_id
    Product.where(product_type_id: type_id)
  end
  
  def to_param_like
    remove_accent(name).parameterize
  end
end
