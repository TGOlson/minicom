require 'spec_helper'

describe UsersController do
  let!(:user_params){ { name: 'Test', email: 'Test@email.com' } }
  let!(:user){ User.create! user_params }

  describe "GET #index" do
    it "should return all users" do
      get :index
      expect(assigns(:users)).to eq [user]
    end
  end

  describe "POST #create" do
    it "should create a new user if one does not exist" do
      expect{
        post :create, user: { name: 'Test2', email: 'Test2@2email.2com' }
      }.to change{User.count}.by 1
    end

    it "should not create a new user if they exists" do
      expect{
        post :create, user: user_params
      }.to change{User.count}.by 0
    end

    it "should respond with a json object of the user" do
      post :create, user: user_params
      expect(JSON.parse(response.body)['user']['email']).to eq user.email
    end

    it "should set CORS headers for the request" do
      post :create, user: user_params
      expect(response.headers['Access-Control-Allow-Origin']).to eq '*'
    end

    it "should update the users last login time" do
      User.any_instance.should_receive(:set_last_login)
      post :create, user: user_params
    end

    it "should mark a users unread messages as read" do
      User.any_instance.should_receive(:mark_unread_messages_as_read)
      post :create, user: user_params
    end
  end
end
