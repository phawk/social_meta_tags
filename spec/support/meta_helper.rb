module MetaHelper
  def meta_content_for(meta_name)
    find(:xpath, "/html/head/meta[@name=\"#{meta_name}\"]/@content", visible: false).native.value
  rescue Capybara::ElementNotFound => e
    nil
  end
end

RSpec.configure do |config|
  config.include MetaHelper, type: :feature
end
