require 'rails_helper'

RSpec.describe "As a visitor" do
  it "I can view the pet id page" do
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

    expect(page).to have_content("Name: #{pet_1.name}")
    expect(page).to have_content("Description: #{pet_1.description}")
    expect(page).to have_content("Approx. Age: #{pet_1.approx_age}")
    expect(page).to have_content("Sex: #{pet_1.sex}")
    expect(page).to have_content("Adoption Status: #{pet_1.status}")

    visit "/pets/#{pet_2.id}"

    expect(page).to have_content("Name: #{pet_2.name}")
    expect(page).to have_content("Description: #{pet_2.description}")
    expect(page).to have_content("Approx. Age: #{pet_2.approx_age}")
    expect(page).to have_content("Sex: #{pet_2.sex}")
    expect(page).to have_content("Adoption Status: #{pet_2.status}")
  end
end
