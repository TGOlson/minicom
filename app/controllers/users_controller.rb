class UsersController < ApplicationController
  helper SortHelper

  before_filter :set_cors_headers, :find_or_create, only: [:create]

  def index
    sort_type = params[:sort_type] || 'login_count'
    sort_direction  = params[:sort_direction] || 'DESC'
    if User.column_names.include?(sort_type) && ['ASC', 'DESC'].include?(sort_direction)
      @users = User.order("#{sort_type} #{sort_direction}")
    else
      @users = User.order("login_count DESC")
    end
  end

  def create
    @user.set_last_login
    @messages = @user.unread_messages
    @user.mark_unread_messages_as_read
    render json: {user: @user, messages: @messages}
  end

  def find_or_create
    if @user = User.find_by_email(params[:user][:email])
      @user
    else
      @user = User.new params[:user]
      @user.save
    end
  end

  def set_cors_headers
    headers['Access-Control-Allow-Origin'] = '*'
  end
end