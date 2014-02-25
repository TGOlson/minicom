class User < ActiveRecord::Base
  attr_accessible :name, :email

  has_many :messages

  def unread_messages
    self.messages.reject(&:read)
  end

  def set_last_login
    self.update_attribute(:last_login, Time.now)
    self.increment!(:login_count)
  end

  def mark_unread_messages_as_read
    unread_messages.map(&:mark_as_read)
  end
end
