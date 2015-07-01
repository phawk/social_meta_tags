module SocialMetaTags
  class Railtie < Rails::Railtie
    initializer "social_meta_tags.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end
