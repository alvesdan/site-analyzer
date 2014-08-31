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

    def pallete
      document_colors.map do |color|
        parse_color(color, type: 'color')
      end
    end

    def to_h
      {
        name: name,
        media: attributes['media'],
        rel: attributes['rel']
      }
    end

    private

    def document
      @document ||= HTTParty.get(url).body rescue ''
    end

    def document_colors
      @document_colors ||= document.scan(/(color:[\s]?#[a-zA-Z0-9]+);/i).to_a.flatten.uniq
    end

    def parse_color(color, type: 'color')
      case type
      when 'background'
      else
        color.gsub(/color:[\s]?#/, '').downcase
      end
    end
  end
end
