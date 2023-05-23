class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    user = User.find_by_id(session[:user_id])
    render json: user
  end

  def current_user
    user = User.find_by_id(session[:user_id])
    render json: user
  end

  # POST /users
  def create
    user = User.create!(user_params)
    if(user)
      session[:user_id] = user.id
      render json: user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit( :user, :id, :password, :name, :phone, :image, :location, :email)
    end
end
