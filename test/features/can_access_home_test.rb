require "test_helper"

class CanAccessHomeTest < Capybara::Rails::TestCase
  def test_homepage_has_content
    # visit root_path
    visit "/"
    page.must_have_content "Welcome aboard"
    page.wont_have_content "Goobye All!"
  end
end
