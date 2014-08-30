module SiteAnalyzer
  class Stylesheet < ::SiteAnalyzer::File

    def self.files(url, document)
      valid_files(document).map do |link|
        new(file_url(url, link.attributes['href'].value))
      end
    end

    def self.valid_files(document)
      document.search('//link').select do |link|
        link.attributes['href'].try(:value).present? &&
        link.attributes['href'].value =~ /\.css/
      end
    end

    def document
      @document ||= HTTParty.get(url).body
    end

    def pallete; end
  end
end
