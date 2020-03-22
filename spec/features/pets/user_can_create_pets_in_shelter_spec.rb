require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'When I visit the shelter pets page' do
    it 'I can create a new pet for that shelter' do
      pet_1 = Pet.create(image: "/", name: "Mia", approx_age: 4, sex: "Male",
      shelter_name: "Golden Valley", description: "Good dog.", status: "Adoptable")
      pet_2 = Pet.create(image: "/", name: "Patch", approx_age: 5, sex: "Male",
      shelter_name: "Happy Hills", description: "Good dog.", status: "Adoptable")
      pet_3 = Pet.create(image: "/", name: "Spot", approx_age: 5, sex: "Female",
      shelter_name: "Golden Valley", description: "Good dog.", status: "Adoptable")
      happy_hills = Shelter.create(name:"Happy Hills",
                             address: "300 Street")
      sunny_valley = Shelter.create(name: "Sunny Valley",
                                  address: "400 Street")
      visit "/shelters/#{sunny_valley.id}/pets"

      expect(page).to have_link('Create Pet')
      click_on 'Create Pet'

      expect(current_path).to eq("/shelters/#{sunny_valley.id}/pets/new")

      fill_in "Image", with: "/"
      fill_in "Name", with: "Lucky"
      fill_in "Description", with: "Good boy."
      fill_in "Approx age", with: "4"
      fill_in "Sex", with: "Male"

      click_on 'Create Pet'

      expect(current_path).to eq("/shelters/#{sunny_valley.id}/pets")
      expect(page).to have_content('Lucky')
    end
  end
end
