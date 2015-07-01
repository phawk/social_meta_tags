require 'request_store'

module SocialMetaTags
  module ViewHelpers
    def social_meta_tags
      meta_data = RequestStore.store[:social_meta_tags] || {}
      meta_data = MetaMapper.new(meta_data, request).construct
      meta_html = Renderer.new(meta_data).render

      meta_html.html_safe
    end

    def social_meta_info(meta_data)
      RequestStore.store[:social_meta_tags] ||= {}
      RequestStore.store[:social_meta_tags].merge! meta_data
    end
  end
end
