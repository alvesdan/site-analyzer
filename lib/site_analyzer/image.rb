module SiteAnalyzer
  class Image < ::SiteAnalyzer::File

    def self.files(url, html)
      valid_files(html).map { |image|
        image.to_h['src']
      }.uniq.map do |src|
        new(file_url(url, src))
      end
    end

    def self.valid_files(html)
      html.search('//img').select do |image|
        image.to_h['src'].present?
      end
    end
  end
end
