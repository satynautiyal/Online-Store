class Order < ApplicationRecord
  belongs_to :orderable, polymorphic: true
  belongs_to :user
  has_many :notifications, as: :notifiable, dependent: :destroy
  after_create :decrease_quantity_from_product_varaint

  def decrease_quantity_from_product_varaint
    if cart == false && orderable_type == "ProductVariant"
      product=ProductVariant.find(orderable_id)
      product.update(quantity: (product.quantity-qty))
    end
  end

  #For Notification
  after_create :order_place_notification 
  def order_place_notification
    @title = I18n.t(:notification_title_order)
    @content = I18n.t(:notification_content_order, orderable_type: orderable_type)
    @notification_data = {"title": @title, "content": @content,"notifiable_type": "Order","notifiable_id": id}
    @user=User.select('id').where(id: orderable.user_id, role: "admin")
    Notification.create_notification(@notification_data, @user)
    #BroadCasting Notification
    ActionCable.server.broadcast("notification_channel", {title: @title,content: @content, for_user: "admin", icon: "<i class='fa fa-shopping-bag' style='font-size:24px;color:#4CAF50;margin-top:4px;'></i>"})
    ActionCable.server.broadcast("notification_channel", {title: @title,content: @content, for_user: "specific_user", current_user: orderable.user_id, icon: "<i class='fa fa-shopping-bag' style='font-size:24px;color:#4CAF50;margin-top:4px;'></i>"})
  end
  
end
