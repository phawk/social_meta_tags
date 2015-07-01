require "rails_helper"

RSpec.describe "Meta tags", type: :feature do
  scenario "The app loads" do
    visit "/"
    expect(page).to have_content("Welcome")
  end

  scenario "are output with <%= social_meta_tags %> helper" do
    visit "/"
    expect(meta_content_for("description")).to eq("My wonderful app")
  end
end
