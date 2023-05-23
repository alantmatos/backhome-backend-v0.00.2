require "test_helper"

class PetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pet = pets(:one)
  end

  test "should get index" do
    get pets_url, as: :json
    assert_response :success
  end

  test "should create pet" do
    assert_difference("Pet.count") do
      post pets_url, params: { pet: { breed: @pet.breed, color: @pet.color, description: @pet.description, favorite_food: @pet.favorite_food, id: @pet.id, medical_condition: @pet.medical_condition, name: @pet.name, size: @pet.size, species: @pet.species } }, as: :json
    end

    assert_response :created
  end

  test "should show pet" do
    get pet_url(@pet), as: :json
    assert_response :success
  end

  test "should update pet" do
    patch pet_url(@pet), params: { pet: { breed: @pet.breed, color: @pet.color, description: @pet.description, favorite_food: @pet.favorite_food, id: @pet.id, medical_condition: @pet.medical_condition, name: @pet.name, size: @pet.size, species: @pet.species } }, as: :json
    assert_response :success
  end

  test "should destroy pet" do
    assert_difference("Pet.count", -1) do
      delete pet_url(@pet), as: :json
    end

    assert_response :no_content
  end
end
