class Message < ActiveRecord::Base
  attr_accessible :text

  belongs_to :user

  def mark_as_read
    self.update_attribute(:read, true)
  end
end