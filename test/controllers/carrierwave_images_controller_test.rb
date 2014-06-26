require "test_helper"

describe CarrierwaveImagesController do

  before do
    @carrierwave_image = carrierwave_images(:one)
  end

  it "must get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:carrierwave_images)
  end

  it "must get new" do
    get :new
    assert_response :success
  end

  it "must create carrierwave_image" do
    assert_difference('CarrierwaveImage.count') do
      post :create, carrierwave_image: {  }
    end

    assert_redirected_to carrierwave_image_path(assigns(:carrierwave_image))
  end

  it "must show carrierwave_image" do
    get :show, id: @carrierwave_image
    assert_response :success
  end

  it "must get edit" do
    get :edit, id: @carrierwave_image
    assert_response :success
  end

  it "must update carrierwave_image" do
    put :update, id: @carrierwave_image, carrierwave_image: {  }
    assert_redirected_to carrierwave_image_path(assigns(:carrierwave_image))
  end

  it "must destroy carrierwave_image" do
    assert_difference('CarrierwaveImage.count', -1) do
      delete :destroy, id: @carrierwave_image
    end

    assert_redirected_to carrierwave_images_path
  end

end
