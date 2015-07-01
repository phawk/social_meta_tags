require 'ostruct'
require 'spec_helper'
require 'social_meta_tags/meta_mapper'

RSpec.describe SocialMetaTags::MetaMapper do
  let(:request) { OpenStruct.new(original_url: "https://example.org/homepage") }

  it "adds data about the url" do
    meta_data = SocialMetaTags::MetaMapper.new({}, request).construct
    expect(meta_data[:"og:url"]).to eq(request.original_url)
  end

  context "when no open graph or twitter card data exists" do
    it "creates defaults for Open Graph and Twitter cards" do
      meta_data = SocialMetaTags::MetaMapper.new({title: "MyApp", description: "My wonderful app"}, request).construct

      expect(meta_data[:title]).to eq("MyApp")
      expect(meta_data[:"og:title"]).to eq("MyApp")
      expect(meta_data[:"twitter:title"]).to eq("MyApp")
    end
  end

  context "when open graph overrides exists" do
    it "uses the specific open graph values" do
      meta_data = SocialMetaTags::MetaMapper.new({title: "MyApp", description: "My wonderful app", og: {title: "MyApp OG"}}, request).construct

      expect(meta_data[:title]).to eq("MyApp")
      expect(meta_data[:"og:title"]).to eq("MyApp OG")
      expect(meta_data[:"twitter:title"]).to eq("MyApp")
    end
  end
end
