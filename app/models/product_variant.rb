class ProductVariant < ApplicationRecord
  #For Soft Delete
  include Discard::Model
  has_many :orders, as: :orderable, dependent: :destroy
  has_many :notifications, as: :notifiable, dependent: :destroy
  has_many :product_views, dependent: :destroy
  has_one_attached :main_image, dependent: :destroy
  has_many_attached :other_images, dependent: :destroy
  belongs_to :product
  has_many :wishlists, dependent: :destroy
  belongs_to :user
  validates_uniqueness_of :batch_no
  #validates :other_images, presence: true
  
  after_create :product_added_notification 
  before_update :notification_if_item_is_wishlisted

  #For Notification
  def product_added_notification 
    @title = I18n.t(:product_added_title)
    @content = I18n.t(:product_added_content, product_name: product.name, user_name: user.name)
    @notification_data = {"title": @title, "content": @content, "notifiable_type": "ProductVariant", "notifiable_id": id}
    @user=User.select('id').all 
    Notification.create_notification(@notification_data, @user)
    #BroadCasting Notification
    ActionCable.server.broadcast("notification_channel", {title: @title,content: @content, for_user: "all", icon: "<i class='fa fa-tags' style='font-size:24px;color:orange'></i>"})
  end

  #Wishlist
  def notification_if_item_is_wishlisted
    if quantity_was == 0
      wishlist_data = Wishlist.select('user_id').where(product_variant_id: id)
      @users=[]
      wishlist_data.each do |user|
        @users << user.user_id
        #BroadCasting Notification
        ActionCable.server.broadcast("notification_channel", {title: I18n.t(:stock_back_title),content: I18n.t(:stock_back_content, product_name: product.name), for_user: "specific_user", current_user: user.user_id, icon: "<i class='fa fa-tags' style='font-size:24px;color:orange'></i>"})
      end
      @title = I18n.t(:stock_back_title)
      @content = I18n.t(:stock_back_content, product_name: product.name)
      @notification_data = {"title": @title, "content": @content, "notifiable_type": "ProductVariant", "notifiable_id": id}
      @user=User.select('id').where(id: @users)
      Notification.create_notification(@notification_data, @user)
    end 
  end

end
