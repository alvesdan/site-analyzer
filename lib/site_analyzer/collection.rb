module SiteAnalyzer
  class Collection
    include Enumerable

    def initialize(members)
      @members = members
    end

    def each(&block)
      @members.each(&block)
    end

    def to_h
      @members.map(&:to_h)
    end
  end
end
