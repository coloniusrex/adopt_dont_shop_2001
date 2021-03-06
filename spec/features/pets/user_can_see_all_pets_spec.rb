require 'rails_helper'

RSpec.describe "View All Pets" do
  it "As a user I can view all pets" do
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

    visit '/pets'

    expect(current_path).to eq('/pets')
    expect(page).to have_content("#{pet_1.name}")
    expect(page).to have_content("Age: #{pet_1.approx_age}")
    expect(page).to have_content("Sex: #{pet_1.sex}")
    expect(page).to have_content("Sheltered At: #{pet_1.shelter_name}")
    expect(page).to have_content("#{pet_2.name}")
    expect(page).to have_content("Age: #{pet_2.approx_age}")
    expect(page).to have_content("Sex: #{pet_2.sex}")
    expect(page).to have_content("Sheltered At: #{pet_2.shelter_name}")
  end
end
