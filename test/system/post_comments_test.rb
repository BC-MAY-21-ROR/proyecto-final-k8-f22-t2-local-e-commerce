require "application_system_test_case"

class PostCommentsTest < ApplicationSystemTestCase
  setup do
    @post_comment = post_comments(:one)
  end

  test "should create post comment" do
    visit post_url(id:1)
    click_on "Añadir Review"

    click_on "Create Post comment"

    assert_text "Usted a posteado un comentario"
    click_on "Back"
  end
end
