require 'spec_helper'
require 'social_meta_tags/renderer'

RSpec.describe SocialMetaTags::Renderer do
  describe "#render" do
    it "can render a single meta tag" do
      html = html_for({title: "MyApp"})
      expect(html).to eq('<meta name="title" content="MyApp">')
    end

    it "can render Open Graph tags" do
      html = html_for({:title => "MyApp", :"og:title" => "MyApp on Facebook"}).split("\n")
      expect(html.first).to eq('<meta name="title" content="MyApp">')
      expect(html.last).to eq('<meta property="og:title" content="MyApp on Facebook">')
    end

    def html_for(meta_data)
      SocialMetaTags::Renderer.new(meta_data).render
    end
  end
end
