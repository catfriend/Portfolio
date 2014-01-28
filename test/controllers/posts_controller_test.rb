require "test_helper"

describe PostsController do

  before do
    @post = posts(:one)
  end

  it "must get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  it "must get new" do
    get :new
    assert_response :success
  end

  it "must create post" do
    assert_difference('Post.count') do
      post :create, post: {  }
    end

    assert_redirected_to post_path(assigns(:post))
  end

  it "must show post" do
    get :show, id: @post
    assert_response :success
  end

  it "must get edit" do
    get :edit, id: @post
    assert_response :success
  end

  it "must update post" do
    put :update, id: @post, post: {  }
    assert_redirected_to post_path(assigns(:post))
  end

  it "must destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end

end
