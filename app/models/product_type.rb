class ProductType < ApplicationRecord
  scope :with_name_like, -> (q) { where('name LIKE ?', "%#{q}%") }
end
