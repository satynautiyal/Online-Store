class Notification < ApplicationRecord
  belongs_to :notifiable, polymorphic: true
  has_many :notification_belongs, dependent: :destroy

  #Notification
  def self.create_notification(notification_data, user)
    @notification=Notification.new(notification_data)
    if @notification.save
      notification_belong=[]
      user.each do |user_id|
          notification_belong << ["#{@notification.id}", "#{user_id.id}","0"]
      end
      columns=[ :notification_id, :user_id, :readed]
      NotificationBelong.import columns, notification_belong
    end
  end
end
