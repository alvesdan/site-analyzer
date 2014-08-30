module SiteAnalyzer
  class Stylesheet < ::SiteAnalyzer::File

    def self.files(url, document)
      valid_files(document).map do |link|
        new(file_url(url, link.to_h['href']), link.to_h)
      end
    end

    def self.valid_files(document)
      document.search('//link').select do |link|
        link.to_h['type'] =~ /css/ || link.to_h['rel'] =~ /stylesheet/
      end
    end

    attr_reader :attributes
    def initialize(url, attributes)
      @url = url
      @attributes = attributes
    end

    def document
      @document ||= HTTParty.get(url).body
    end

    def to_h
      {
        name: name,
        media: attributes['media'],
        rel: attributes['rel']
      }
    end
  end
end
