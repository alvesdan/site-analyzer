module SiteAnalyzer
  class Url
    require 'uri'
    attr_reader :url, :file_path
    def initialize(url, file_path)
      @url = URI(url)
      @file_path = file_path
    end

    def formatted_url
      return "http:#{file_path}" if file_path =~ /\A\/\//
      return ::File.join(protocol, domain, file_path) if file_path =~ /\A\/\w/
      ::File.join(protocol, domain, clean_url_path, clean_path)
    end

    private

    def domain
      url.host
    end

    def protocol
      "#{url.scheme}://"
    end

    def url_path
      url.path.gsub(/\/[\w]+\.[\w]+\z/, '')
    end

    def file_path_parts
      file_path.split('/')
    end

    def clean_url_path
      url_path_clone = url_path.split('/')
      file_path_parts.each do |part|
        url_path_clone.pop if part == '..'
      end
      url_path_clone.join('/')
    end

    def clean_path
      file_path_parts.select { |part| part != '..' }.join('/')
    end
  end
end
