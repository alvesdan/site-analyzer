require 'rails_helper'

describe SiteAnalyzer::Url do

  let(:zero_levels) { SiteAnalyzer::Url.new('http://www.example.com/1/2', 'style.css') }
  let(:one_level) { SiteAnalyzer::Url.new('http://www.example.com/1/2', '../style.css') }
  let(:two_levels) { SiteAnalyzer::Url.new('http://www.example.com/1/2', '../../style.css') }
  let(:complex_url) { SiteAnalyzer::Url.new('https://github.com/alvesdan/site-analyzer/blob/master/lib/site_analyzer/url.rb', 'style.css') }
  let(:complex_url_two) { SiteAnalyzer::Url.new('https://github.com/alvesdan/site-analyzer/blob/master/lib/site_analyzer/url.rb', '../style.css') }

  it 'returns formatted url for zero levels' do
    expect(zero_levels.formatted_url).to eq 'http://www.example.com/1/2/style.css'
  end

  it 'returns formatted url for one level' do
    expect(one_level.formatted_url).to eq 'http://www.example.com/1/style.css'
  end

  it 'returns formatted url for two levels' do
    expect(two_levels.formatted_url).to eq 'http://www.example.com/style.css'
  end

  it 'return formatted url for complex one' do
    expect(complex_url.formatted_url).to eq 'https://github.com/alvesdan/site-analyzer/blob/master/lib/site_analyzer/style.css'
  end

  it 'return formatted url for complex one' do
    expect(complex_url_two.formatted_url).to eq 'https://github.com/alvesdan/site-analyzer/blob/master/lib/style.css'
  end
end
