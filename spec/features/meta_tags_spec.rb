require "rails_helper"

RSpec.describe "Meta tags", type: :feature do
  scenario "Adds open graph tags for site name" do
    visit "/"
    expect(meta_content_for("og:site_name")).to eq("MySite!")
  end

  scenario "Adds open graph tags for url" do
    visit "/about"
    expect(meta_content_for("og:url")).to eq("http://www.example.com/about")
  end

  scenario "The app loads" do
    visit "/"
    expect(page).to have_content("Welcome")
  end

  scenario "are output with <%= social_meta_tags %> helper" do
    visit "/"
    expect(meta_content_for("title")).to eq("MyApp")
    expect(meta_content_for("description")).to eq("My wonderful app")
  end

  context "when visiting the about page" do
    scenario "renders different meta tags" do
      visit "/about"
      expect(meta_content_for("title")).to eq("MyApp - About us")
      expect(meta_content_for("description")).to eq("Our team is the bestest")
      expect(meta_content_for("og:title")).to eq("About our team")
      expect(meta_content_for("og:image")).to eq("https://example.org/assets/full-team.png")
      expect(meta_content_for("twitter:title")).to eq("About our team")
      expect(meta_content_for("twitter:image")).to eq("https://example.org/assets/full-team.png")
    end
  end
end
