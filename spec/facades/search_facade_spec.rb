require 'rails_helper'

RSpec.describe SearchFacade do
  subject = SearchFacade.new('Stark')

  it 'exists' do
    expect(subject).to be_a(SearchFacade)
  end

  it '#member_count' do
    VCR.use_cassette('stark_members') do
      expect(subject.member_count).to eq(11)
    end
  end

  it '#members' do
    VCR.use_cassette('stark_members') do
      expect(subject.members.first).to be_a(HouseMember)
      expect(subject.members.first.id).to eq(1)
      expect(subject.members.first.name).to eq('Rickard Stark')
    end
  end
end
