require 'social_meta_tags/meta_mapper'
require 'social_meta_tags/renderer'
require 'social_meta_tags/view_helpers'
require 'social_meta_tags/railtie' if defined?(Rails)

module SocialMetaTags
  class << self
		def configuration
			@configuration ||= Configuration.new
		end

    def configure
      yield(configuration)
    end
  end

  class Configuration
    attr_accessor :site_name
  end
end
