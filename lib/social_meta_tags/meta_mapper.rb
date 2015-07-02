require 'active_support/core_ext/object/deep_dup'
require 'active_support/core_ext/hash'

module SocialMetaTags
  class MetaMapper
    attr_reader :meta_data, :request

    def initialize(meta_data, request)
      @meta_data = meta_data.deep_dup
      @request = request
    end

    def construct
      meta_data[:og] ||= {}
      meta_data[:twitter] ||= {}
      meta_data[:og].reverse_merge!(default_meta_data[:og])
      meta_data[:twitter].reverse_merge!(default_meta_data[:twitter])

      # Fields that can be copied into og or twitter
      overall_fields = meta_data.slice(:title, :description, :image)

      meta_data[:og] = meta_data[:og].reverse_merge(overall_fields)
      meta_data[:twitter] = meta_data[:twitter].reverse_merge(overall_fields)

      flatten_tags(meta_data.deep_dup)
    end

    private

    def flatten_tags(md)
      [:og, :twitter].each do |meta_data_type|
        md.delete(meta_data_type).each do |k,v|
          md["#{meta_data_type}:#{k}".to_sym] = v
        end
      end

      md
    end

    def default_meta_data
      {
        og: {
          site_name: SocialMetaTags.configuration.site_name || "[social_meta_tags] No Site Name",
          url: request.original_url
        },
        twitter: {}
      }
    end
  end
end
