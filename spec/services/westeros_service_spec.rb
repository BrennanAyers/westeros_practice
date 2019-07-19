require 'rails_helper'

describe WesterosService do
  subject = WesterosService.new('Stark')

  it 'exists' do
    expect(subject).to be_a(WesterosService)
  end

  it '#members' do
    VCR.use_cassette('stark_members') do
      family_members = subject.members

      expect(family_members).to be_an Array
      expect(family_members.count).to eq(11)
      expect(family_members.first).to be_a Hash
      expect(family_members.first).to have_key(:name)
      expect(family_members.first).to have_key(:id)
    end
  end
end
