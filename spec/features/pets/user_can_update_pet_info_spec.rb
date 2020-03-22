require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'When I visit the pets show page and click Update Pet' do
    it 'I can fill out the form and update the pet info' do
      happy_hills = Shelter.create(name:"Happy Hills",
      address: "300 Street")
      golden_valley = Shelter.create(name: "Sunny Valley",
        address: "400 Street")
      pet_1 = Pet.create(image: "/", name: "Spot", approx_age: 4, sex: "Male",
      shelter_name: "Happy Hills", description: "Good boy", status: "Adoptable",
      shelter_id: "#{happy_hills.id}")
      pet_2 = Pet.create(image: "/", name: "Patch", approx_age: 5, sex: "Male",
      shelter_name: "Golden Valley", description: "Good boy", status: "Adoptable",
      shelter_id: "#{golden_valley.id}")

      visit "/pets/#{pet_1.id}"

      expect(page).to have_button('Update Pet')
      click_on 'Update Pet'

      expect(current_path).to eq("/pets/#{pet_1.id}/edit")

      fill_in 'Image', with: '/'
      fill_in 'Name', with: 'Spot'
      fill_in 'Approx age', with: '6'
      fill_in 'Sex', with: 'Male'
      fill_in 'Description', with: 'Really good boy'
      fill_in 'Name', with: 'Spot'

      click_on 'Update Pet'

      expect(current_path).to eq("/pets/#{pet_1.id}")
      expect(page).to have_content('Really good boy')
      expect(page).to_not have_content('Good boy')
    end
  end
end
