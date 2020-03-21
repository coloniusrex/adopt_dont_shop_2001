require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I click on a shelter's pets list" do
    it "I can view all the pets at that shelter" do
      pet_1 = Pet.create(image: "/", name: "Spot", approx_age: 4, sex: "Male",
      sheltered_at: "Happy Hills")
      pet_2 = Pet.create(image: "/", name: "Patch", approx_age: 5, sex: "Male",
      sheltered_at: "Golden Valley")
      happy_hills = Shelter.create(name:"Happy Hills",
                             address: "300 Street")
      sunny_valley = Shelter.create(name: "Sunny Valley",
                                  address: "400 Street")
      visit "/shelters/#{happy_hills.id}"
      click_on "Pets"

      expect(current_path).to eq("/shelters/#{happy_hills.id}/pets")
      expect(page).to have_content('Spot')
      expect(page).to_not have_content('Patch')

      visit "/shelters/#{sunny_valley.id}"
      click_on "Pets"

      expect(page).to_not have_content('Patch')
      expect(page).to_not have_content('Spot')

    end
  end
end
