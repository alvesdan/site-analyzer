module SiteAnalyzer
  class Url
    attr_reader :url, :file_path
    def initialize(url, file_path)
      @url = normalize_url(url)
      @file_path = file_path
    end

    def formatted_url
      return file_path if file_path =~ /\A\/\//
      ::File.join(protocol, clean_url, clean_path)
    end

    private

    def normalize_url(url)
      url.gsub(/\/.*\.[a-z]{3,4}/)
    end

    def protocol
      url.match(/http[s]?:\/\//).to_s || 'http://'
    end

    def url_parts
      url.gsub(/http[s]?:\/\//, '').split('/')
    end

    def file_path_parts
      file_path.split('/')
    end

    def clean_url
      url_parts_clone = url_parts
      file_path_parts.each do |part|
        url_parts_clone.pop if part == '..'
      end
      url_parts_clone.join('/')
    end

    def clean_path
      file_path_parts.select { |part| part != '..' }.join('/')
    end
  end
end
