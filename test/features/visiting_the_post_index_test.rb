require "test_helper"

feature "VisitingThePostIndex" do
  scenario "with existing posts, show list" do
    # Given existing posts
    Post.create(Title: "Becoming a Code Fellow", body: "Means striving for excellence.")
  # When I visit /posts
    visit posts_path
  # Then the existing posts should be loaded
    page.text.must_include "Becoming a Code Fellow"
  end
end
