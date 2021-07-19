class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]

  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({ user_id: @user.id,username: @user.username })
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
    @user = User.find(params[:user_id])
    p '////////////'
    p @user
    job_id = params[:job_id]
    user_id = params[:user_id]
    @user.applications.create(user_id:user_id,job_id:job_id)
  end

  def auto_login
    render json: @user
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end
