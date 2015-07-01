require "rails_helper"

RSpec.describe "Meta tags", type: :feature do
  scenario "The app loads" do
    visit "/"
    expect(page).to have_content("Welcome")
  end
end
