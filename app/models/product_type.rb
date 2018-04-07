class ProductType < ApplicationRecord
  scope :with_name_like, -> (q) { where('name LIKE ?', "%#{q}%") }
  
  ransacker :id do
    Arel.sql("to_char(\"#{table_name}\".\"id\", '99999999')")
  end
end
