require 'spec_helper'
require 'social_meta_tags/renderer'

RSpec.describe SocialMetaTags::Renderer do
  describe "#render" do
    it "can render a single meta tag" do
      html = html_for({title: "MyApp"})
      expect(html).to eq('<meta name="title" content="MyApp">')
    end

    def html_for(meta_data)
      SocialMetaTags::Renderer.new(meta_data).render
    end
  end
end
