require 'test_helper'

class TripFeaturesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trip_features)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trip_feature" do
    assert_difference('TripFeature.count') do
      post :create, :trip_feature => { }
    end

    assert_redirected_to trip_feature_path(assigns(:trip_feature))
  end

  test "should show trip_feature" do
    get :show, :id => trip_features(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => trip_features(:one).to_param
    assert_response :success
  end

  test "should update trip_feature" do
    put :update, :id => trip_features(:one).to_param, :trip_feature => { }
    assert_redirected_to trip_feature_path(assigns(:trip_feature))
  end

  test "should destroy trip_feature" do
    assert_difference('TripFeature.count', -1) do
      delete :destroy, :id => trip_features(:one).to_param
    end

    assert_redirected_to trip_features_path
  end
end
