require 'rails_helper'

describe Analysis do

  it 'generates shortened URL' do
    analysis = Analysis.create(url: 'http://www.globo.com')
    expect(analysis.reload.shortened_url).to_not be_nil
  end
end
