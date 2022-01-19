class Category < ApplicationRecord
    #For Soft Delete
    include Discard::Model
    has_many :products,dependent: :destroy
    has_many :product_services,dependent: :destroy
    enum category_of: { 
        product: 0, 
        product_service: 1
    }
    validates :name, uniqueness: true
end
