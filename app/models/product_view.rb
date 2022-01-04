class ProductView < ApplicationRecord
  belongs_to :viewable, polymorphic: true
end
