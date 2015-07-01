require 'spec_helper'
require 'social_meta_tags/meta_mapper'

RSpec.describe SocialMetaTags::MetaMapper do
  context "when no open graph or twitter card data exists" do
    it "creates defaults for Open Graph and Twitter cards" do
      meta_data = SocialMetaTags::MetaMapper.new({title: "MyApp", description: "My wonderful app"}).construct

      expect(meta_data[:title]).to eq("MyApp")
      expect(meta_data[:"og:title"]).to eq("MyApp")
      expect(meta_data[:"twitter:title"]).to eq("MyApp")
    end
  end

  context "when open graph overrides exists" do
    it "uses the specific open graph values" do
      meta_data = SocialMetaTags::MetaMapper.new({title: "MyApp", description: "My wonderful app", og: {title: "MyApp OG"}}).construct

      expect(meta_data[:title]).to eq("MyApp")
      expect(meta_data[:"og:title"]).to eq("MyApp OG")
      expect(meta_data[:"twitter:title"]).to eq("MyApp")
    end
  end
end
