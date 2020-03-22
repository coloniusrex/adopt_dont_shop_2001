require 'rails_helper'

describe Pet, type: :model do

  describe 'relationships' do
    it { should belong_to :shelter }
  end
  # describe 'class methods' do
    # it '.pet_count' do
    #   pet_1 = Pet.create(image: "/", name: "Spot", approx_age: 4, sex: "Male",
    #   sheltered_at: "Happy Hills", description: "Good dog.", status: "Adoptable")
    #   pet_2 = Pet.create(image: "/", name: "Patch", approx_age: 5, sex: "Male",
    #   sheltered_at: "Golden Valley", description: "Good dog.", status: "Adoptable")
    #   happy_hills = Shelter.create(name:"Happy Hills",
    #                          address: "300 Street")
    #   sunny_valley = Shelter.create(name: "Sunny Valley",
    #                               address: "400 Street")
    #
    #   expect(Pet.pet_count).to eq(2)
    # end
  # end
end
