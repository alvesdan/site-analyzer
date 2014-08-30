require 'rails_helper'

describe SiteAnalyzer::HTML do

  let(:file_path) { File.join(Rails.root, 'spec', 'fixtures', 'one.html') }
  let(:html_body) { File.read(file_path) }

  subject { SiteAnalyzer::HTML.new('http://www.example.com', html_body) }

  it 'reads HTML using Nokogiri' do
    expect(subject.document).to be_kind_of(Nokogiri::HTML::Document)
  end

  it 'finds stylesheets' do
    expect(subject.stylesheets.count).to eq 2
  end

  it 'finds javascripts' do
    expect(subject.javascripts.count).to eq 2
  end

end
