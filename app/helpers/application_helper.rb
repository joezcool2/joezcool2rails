module ApplicationHelper

  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::TagHelper
  include ActiveLinkTo

  def set_path(path, purge_cache = true)
    request.original_fullpath = path
    if purge_cache && defined?(@is_active_link)
      remove_instance_variable(:@is_active_link)
    end
  end

  def assert_html(html, selector, value = nil)
    doc = Nokogiri::HTML(html)
    element = doc.at_css(selector)
    assert element, "No element found at: `#{selector}`"
    assert_equal value, element.text if value
  end

  def active_link_to(name = nil, options = nil, html_options = nil, &block)
    class_active = html_options[:active] || "active"
    html_options.delete(:active)
    html_options[:class] = "#{html_options[:class]} #{class_active}" if current_page?(options)
    link_to(name, options, html_options, &block)
  end

end
