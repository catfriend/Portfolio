require "test_helper"

feature "DeletingAPost" do
  scenario "post is deleted with a click" do
    # Given an existing post
    post = Post.create(title: "Becoming a Code Fellow", body: "Means striving for excellence")
    visit posts_path
    # When the delete link is clicked
    title = posts(:cr).title
    page.find("[href='#{post_path(posts(:cr))}'][data-method]").click
    # Then the post is deleted
    page.wont_have_content title
  end
end
