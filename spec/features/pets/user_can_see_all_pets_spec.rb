require 'rails_helper'

RSpec.describe "View All Pets" do
  it "As a user I can view all pets" do
      pet_1 = Pet.create(image: "/", name: "Spot", approx_age: 4, sex: "Male",
      sheltered_at: "Happy Hills")
      pet_2 = Pet.create(image: "/", name: "Patch", approx_age: 5, sex: "Male",
      sheltered_at: "Golden Valley")

      visit '/pets'

      expect(current_path).to eq('/pets')
      expect(page).to have_content("#{pet_1.name}")
      expect(page).to have_content("Age: #{pet_1.approx_age}")
      expect(page).to have_content("Sex: #{pet_1.sex}")
      expect(page).to have_content("Sheltered At: #{pet_1.sheltered_at}")
      expect(page).to have_content("#{pet_2.name}")
      expect(page).to have_content("Age: #{pet_2.approx_age}")
      expect(page).to have_content("Sex: #{pet_2.sex}")
      expect(page).to have_content("Sheltered At: #{pet_2.sheltered_at}")
  end
end
