module SiteAnalyzer
  class Javascript < ::SiteAnalyzer::File

    def self.files(url, document)
      valid_files(document).map do |script|
        new(file_url(url, script.attributes['src'].value))
      end
    end

    def self.valid_files(document)
      document.search('//script').select do |script|
        script.attributes['src'].try(:value).present?
      end
    end
  end
end
