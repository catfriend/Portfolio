require "test_helper"

feature "CheckForZurb" do
  scenario "determine if Zurb is in use" do
    visit root_path
    # page.must_include 'columns'
    # page.source.must_include ("foundation.js")
    # page.source.must_include("foundation_and_overrides.css")
  end
end
