class UpdateProductVariantJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ProductVariant.where("expiry <= ?", Date.today).destroy_all
  end
end
