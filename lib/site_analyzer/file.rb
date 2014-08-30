module SiteAnalyzer
  class File

    def self.files(document)
      fail 'Not implemented'
    end

    def self.valid_files(document)
      fail 'Not implemented'
    end

    def self.file_url(url, path)
      return path if path =~ /http[s]?:\/\//
      ::SiteAnalyzer::Url.new(url, path).formatted_url
    end

    attr_reader :url
    def initialize(url)
      @url = url
    end

    def name
      url.split('/').last
    end

    def to_h
      {
        url: url,
        name: name
      }
    end
  end
end
