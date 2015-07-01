require 'active_support/core_ext/object/deep_dup'
require 'active_support/core_ext/hash'

module SocialMetaTags
  class MetaMapper
    attr_reader :meta_data

    def initialize(meta_data)
      @meta_data = meta_data.deep_dup
    end

    def construct
      meta_data.reverse_merge!(default_meta_data)

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
        title: "",
        description: "",
        og: {},
        twitter: {}
      }
    end
  end
end
