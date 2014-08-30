module SiteAnalyzer
  class MetaTag

    def self.tags(document)
      document.search('//meta').map do |meta_tag|
        new(meta_tag.to_h)
      end
    end

    attr_reader :attributes
    def initialize(attributes)
      @attributes = attributes
    end

    def to_h
      attributes
    end
  end
end
