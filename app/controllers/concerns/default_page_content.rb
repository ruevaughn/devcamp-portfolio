module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Chase Jensen Portfolio | My Website"
    @seo_keywords = "Chase Jensens Portfolio"
  end
end
