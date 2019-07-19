require 'spec_helper'
require './app/models/house_member'

RSpec.describe HouseMember do
  subject = HouseMember.new("id": 100,
                        "name": "Kyle Corndog",
                        "house_id": 0,
                        "created_at": "2019-05-15T03:54:20.930Z",
                        "updated_at": "2019-05-15T03:54:20.930Z")

  it 'exists' do
    expect(subject).to be_a(HouseMember)
  end

  it 'has attributes' do
    expect(subject.id).to eq(100)
    expect(subject.name).to eq('Kyle Corndog')
  end
end
