require 'rails_helper'

RSpec.describe SearchFacade do
  subject = SearchFacade.new('Stark')

  it 'exists' do
    expect(subject).to be_a(SearchFacade)
  end

  it '#member_count' do
    expect(subject.member_count).to eq(11)
  end
end
