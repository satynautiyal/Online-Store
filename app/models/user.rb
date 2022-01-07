class User < ApplicationRecord
  #For Soft Delete
  include Discard::Model
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { 
    admin: 0, 
    seller: 1, 
    buyer:2 
  }

  has_many :orders, dependent: :destroy
  has_many :wishlists
  has_many :products, dependent: :destroy
  has_many :product_services, dependent: :destroy
  has_many :notification_belongs, dependent: :destroy
  has_many :notifications, as: :notifiable, dependent: :destroy
  has_many :product_variants, dependent: :destroy
  
  #For Notification
  after_create :new_user_notification
  
  def new_user_notification
    @title = "A new user is arrived"
    @content = "#{name} has registered successfully"
    @notification_data = {"title": @title, "content": @content,"notifiable_type": "User","notifiable_id": id}
    @user=User.select('id').where(id: 4)
    Notification.create_notification(@notification_data, @user)
    #BroadCasting Notification
    #ActionCable.server.broadcast("notification_channel", {title: "A new user is arrived",content: "#{name} has registered successfully", for_user: "admin", icon: "<i class='fa fa-user-circle-o' style='font-size:24px;color:red'></i>"})
  end

  def self.deleted_user_notification
    @title = "Account Deleted"
    @content = "#{name} has deleted his account"
    @notification_data = {"title": @title, "content": @content,"notifiable_type": "User","notifiable_id": 4}
    @user=User.select('id').where(id: 4)
    Notification.create_notification(@notification_data, @user)
    #BroadCasting Notification
    #ActionCable.server.broadcast("notification_channel", {title: "Account Deleted",content: "#{name} has deleted his account", for_user: "admin", icon: "<i class='fa fa-user' style='font-size:24px'></i>"})
  end

  #Check if User is active or inactive
  def is_user_active
    if discarded?
      return false
    else
      return true
    end
  end
  
  #authenticate user
  def active_for_authentication?
    super && self.is_user_active
  end
  
  def inactive_message
    "Sorry, this account has been deactivated."
  end

  #After deleting user account soft Delete products added by that user
  def self.soft_delete_user_products user_id
    Product.where(user_id: user_id).discard_all
    ProductVariant.where(user_id: user_id).discard_all
    ProductService.where(user_id: user_id).discard_all
  end

end
