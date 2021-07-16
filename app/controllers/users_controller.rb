class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]

  def create
    # console('sss')
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({ username: @user.username })
      render json: { token: token }
    else
      render json: { error: 'Invalid username or password' }
    end
  end

  def login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      token = encode_token({ user_id: @user.id, username: @user.username })
      render json: { token: token }
    else
      render json: { error: 'Invalid username or password' }
    end
  end

  def apply
    render json: { params: params }
    # @user.applications.create()
  end

  def auto_login
    render json: @user
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end
