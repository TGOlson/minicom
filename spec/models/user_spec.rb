require 'spec_helper'

describe User do
  let!(:user){ User.create! name: 'Test', email: 'Test@email.com'}
  let!(:unread_message){ Message.create text: 'hello test' }
  let!(:message_setup){ user.messages << unread_message }

  it {should have_many :messages}
  it {should allow_mass_assignment_of :name}
  it {should allow_mass_assignment_of :email}

  describe '#unread_messages' do
    it "should return all unread messages for a user" do
      expect(user.unread_messages).to eq [unread_message]
    end

    it "should not return a message that is read" do
      unread_message.mark_as_read
      expect(user.unread_messages).to be_empty
    end
  end

  describe "#set_last_login" do
    it "should update the users last login time" do
      expect(user.last_login).to be_nil
      user.set_last_login
      expect(user.last_login).to_not be_nil
    end

    it "should increment the login count by 1" do
      expect{
        user.set_last_login
        }.to change{user.login_count}.by 1
    end
  end

  describe "#mark_unread_messages_as_read" do
    it "should mark all of a users unread messages as read" do
      expect(user.messages.first.read).to be_false
      user.mark_unread_messages_as_read
      expect(user.messages.first.read).to be_true
    end
  end
end