require 'rails_helper'

RSpec.describe 'As a user', type: :feature do
  context 'when I visit the root path' do
    it 'and I select Greyjoy from the dropdown and click Get Members' do
      visit root_path
      # And I select "Greyjoy" from the dropdown
      select 'Greyjoy', from: '#family-select'
      # And I click on "Get Members"
      click_on 'Get Members'
      # Then my path should be "/search" with "house=greyjoy" in the parameters
      expect(current_path).to eq('/search?house=greyjoy')
      # And I should see a message "7 Members"
      expect(page).to have_content('7 Members')
      # And I should see a list of the 7 members of House Greyjoy
      within '#results' do
        expect(page).to have_css('.member', count: 7)
        # And I should see a name and id for each member.
        expect(page).to have_content('Name: ', count: 7)
        expect(page).to have_content('ID: ', count: 7)
      end
    end
  end
end
