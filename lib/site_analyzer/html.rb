module SiteAnalyzer
  class HTML
    include Colors
    
    attr_reader :url, :document
    def initialize(url = '', html = '')
      @url = url
      @document = Nokogiri::HTML(html)
    end

    def title
      document.css('title').text
    end

    def meta_tags
      @meta_tags ||= ::SiteAnalyzer::Collection.new(MetaTag.tags(document))
    end

    def stylesheets
      @stylesheets ||= ::SiteAnalyzer::Collection.new(Stylesheet.files(url, document))
    end

    def javascripts
      @javascripts ||= ::SiteAnalyzer::Collection.new(Javascript.files(url, document))
    end

    def images
      @images ||= ::SiteAnalyzer::Collection.new(Image.files(url, document))
    end

    def colors
      @colors ||= order_colors(stylesheets.map(&:pallete).flatten)
    end

    def to_h
      {
        meta_tags: meta_tags.to_h,
        stylesheets: stylesheets.to_h,
        javascripts: javascripts.to_h,
        images: images.to_h
      }
    end
  end
end
