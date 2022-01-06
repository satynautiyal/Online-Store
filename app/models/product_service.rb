class ProductService < ApplicationRecord
    #For Soft Delete
    include Discard::Model
    searchkick word_middle: [:name, :description]
    has_many :orders, as: :orderable, dependent: :destroy
    has_many :notifications, as: :notifiable, dependent: :destroy
    has_many :product_views, as: :viewable, dependent: :destroy
    belongs_to :user
    has_one_attached :main_image
    has_many_attached :other_images, dependent: :destroy

    belongs_to :category
    after_create :product_service_added_notification
    
    #Notification For All
    def product_service_added_notification 
        @title = I18n.t(:product_service_added_title)
        @content = I18n.t(:product_service_added_content, product_service_name: name, user_name: user.name)
        @notification_data = {"title": @title, "content": @content, "notifiable_type": "ProductService", "notifiable_id": id}
        @user=User.select('id').all 
        Notification.create_notification(@notification_data, @user)
        #BroadCasting Notification
        ActionCable.server.broadcast("notification_channel", {title: @title,content: @content, for_user: "all", icon: "<i class='fa fa-tags' style='font-size:24px;color:orange'></i>"})
    end
    
end
