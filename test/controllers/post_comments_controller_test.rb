require "test_helper"

class PostCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_comment = post_comments(:one)
  end

  test "should get new" do
    get new_comment_url
    assert_response :success
  end

  test "should create post_comment" do
    assert_difference("PostComment.count") do
      post post_comments_url, params: { post_comment: {  } }
    end

    assert_redirected_to post_url(PostComment.last.post)
  end
end
