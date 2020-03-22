require 'rails_helper'

RSpec.describe 'As a user' do
  it 'I can delete a pet by clicking Delete' do
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

    expect(page).to have_button('Delete Pet')
    click_on 'Delete Pet'

    expect(current_path).to eq('/pets')
    expect(page).to_not have_content("#{pet_1.name}")
  end
end
