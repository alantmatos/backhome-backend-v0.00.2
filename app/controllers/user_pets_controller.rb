class UserPetsController < ApplicationController
  before_action :set_user_pet, only: %i[ show update destroy ]

  # GET /user_pets
  def index
    @user_pets = UserPet.all

    render json: @user_pets
  end

  # GET /user_pets/1
  def show
    render json: @user_pet
  end

  # POST /user_pets
  def create
    @user_pet = UserPet.new(user_pet_params)

    if @user_pet.save
      render json: @user_pet, status: :created, location: @user_pet
    else
      render json: @user_pet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_pets/1
  def update
    if @user_pet.update(user_pet_params)
      render json: @user_pet
    else
      render json: @user_pet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_pets/1
  def destroy
    @user_pet.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_pet
      @user_pet = UserPet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_pet_params
      params.require(:user_pet).permit(:id, :user_id, :pet_id)
    end
end
