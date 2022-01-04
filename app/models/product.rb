class Product < ApplicationRecord
    #For Soft Delete
    include Discard::Model
    searchkick word_middle: [:name]
    has_many :orders, as: :orderable, dependent: :destroy
    has_many :product_variants, dependent: :destroy
    has_many :notifications, as: :notifiable, dependent: :destroy
    has_one_attached :main_image
    belongs_to :category
    accepts_nested_attributes_for :product_variants
    belongs_to :user
    validates :category_id, presence: true
    #validates :main_image, presence: true
    
    
end
