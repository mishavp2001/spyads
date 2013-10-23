module ApplicationHelper
  
  def shorten_url url
    url.blank? ? "" : (URI.parse(url).host + "..." + url.split('/').last)
  end
end
