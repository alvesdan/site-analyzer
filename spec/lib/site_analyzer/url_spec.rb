require 'rails_helper'

describe SiteAnalyzer::Url do

  let(:zero_levels) { SiteAnalyzer::Url.new('http://www.example.com/1/2', 'style.css') }
  let(:one_level) { SiteAnalyzer::Url.new('http://www.example.com/1/2', '../style.css') }
  let(:two_levels) { SiteAnalyzer::Url.new('http://www.example.com/1/2', '../../style.css') }

  it 'returns formatted url for zero levels' do
    expect(zero_levels.formatted_url).to eq 'http://www.example.com/1/2/style.css'
  end

  it 'returns formatted url for one level' do
    expect(one_level.formatted_url).to eq 'http://www.example.com/1/style.css'
  end

  it 'returns formatted url for two levels' do
    expect(two_levels.formatted_url).to eq 'http://www.example.com/style.css'
  end
end
