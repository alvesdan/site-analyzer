module SiteAnalyzer
  class HTML
    attr_reader :url, :document
    def initialize(url = '', html = '')
      @url = url
      @document = Nokogiri::HTML(html)
    end

    def stylesheets
      @stylesheets ||= FileCollection.new(Stylesheet.files(url, document))
    end

    def javascripts
      @javascripts ||= FileCollection.new(Javascript.files(url, document))
    end

    def images
      @images ||= FileCollection.new(Image.files(url, document))
    end

    def to_json
      {
        stylesheets: stylesheets.to_json,
        javascripts: javascripts.to_json,
        images: images.to_json
      }
    end
  end
end
