module SiteAnalyzer
  class Image < ::SiteAnalyzer::File

    def self.files(url, html)
      valid_files(html).map do |image|
        new(file_url(url, image.attributes['src'].value))
      end
    end

    def self.valid_files(html)
      html.search('//img').select do |image|
        image.attributes['src'].try(:value).present?
      end
    end
  end
end
