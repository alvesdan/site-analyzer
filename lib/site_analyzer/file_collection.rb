module SiteAnalyzer
  class FileCollection
    include Enumerable

    def initialize(members)
      @members = members
    end

    def each(&block)
      @members.each(&block)
    end

    def to_json
      @members.map(&:to_json)
    end
  end
end
