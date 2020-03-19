require 'rails_helper'

RSpec.describe 'Create New Shelter' do
  describe 'As a visitor' do
    describe 'When I visit the new shelter form by clicking a link on the index' do
      it 'I can create a new shelter' do

        visit '/shelters'

        click_on 'Create Shelter'

        expect(current_path).to eq('/shelters/new')

        fill_in 'Name', with: 'Megan'
        fill_in 'Address', with: '123 H Road'
        fill_in 'City', with: 'Denver'
        fill_in 'State', with: 'Colorado'
        fill_in 'Zip', with: '80203'
        click_on 'Create Shelter'

        expect(current_path).to eq("/shelters")
        expect(page).to have_content('Megan')
      end
    end
  end
end
