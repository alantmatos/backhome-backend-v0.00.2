require "test_helper"

class UserPetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_pet = user_pets(:one)
  end

  test "should get index" do
    get user_pets_url, as: :json
    assert_response :success
  end

  test "should create user_pet" do
    assert_difference("UserPet.count") do
      post user_pets_url, params: { user_pet: { id: @user_pet.id, pet_id: @user_pet.pet_id, user_id: @user_pet.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show user_pet" do
    get user_pet_url(@user_pet), as: :json
    assert_response :success
  end

  test "should update user_pet" do
    patch user_pet_url(@user_pet), params: { user_pet: { id: @user_pet.id, pet_id: @user_pet.pet_id, user_id: @user_pet.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy user_pet" do
    assert_difference("UserPet.count", -1) do
      delete user_pet_url(@user_pet), as: :json
    end

    assert_response :no_content
  end
end
