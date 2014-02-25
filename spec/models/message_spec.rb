require 'spec_helper'

describe Message do
  let!(:message){ Message.create text: 'hello test' }

  it {should belong_to :user}
  it {should allow_mass_assignment_of :text}

  describe "message read attribute" do
    it "should default to false upon creation" do
      expect(message.read).to be_false
    end
  end

  describe "#mark_as_read" do
    it "should mark a message instance as read" do
      expect(message.read).to be_false
      message.mark_as_read
      expect(message.read).to be_true
    end
  end
end
