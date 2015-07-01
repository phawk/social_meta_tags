module SocialMetaTags
  class Renderer
    OPEN_GRAPH_TAGS = %w(og:title og:description og:image)
    TWITTER_CARD_TAGS = %w(twitter:title twitter:description twitter:image)

    attr_reader :meta_data

    def initialize(meta_data)
      @meta_data = meta_data
    end

    def render
      meta_data.map do |key, value|
        "<meta #{property_name_for(key)}=\"#{key}\" content=\"#{value}\">"
      end.join("\n")
    end

    private

    def property_name_for(key)
      case key.to_s
      when %r{^(twitter|og)\:}
        "property"
      else
        "name"
      end
    end
  end
end
