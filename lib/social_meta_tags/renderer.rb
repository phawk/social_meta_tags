module SocialMetaTags
  class Renderer
    attr_reader :meta_data

    def initialize(meta_data)
      @meta_data = meta_data
    end

    def render
      meta_data.map do |key, value|
        "<meta name=\"#{key}\" content=\"#{value}\">"
      end.join("\n")
    end
  end
end
