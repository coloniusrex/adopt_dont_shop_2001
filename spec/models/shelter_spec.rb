require 'rails_helper'

describe Shelter, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end
  describe 'relationships' do
    it { should have_many :pets }
  end

  # describe 'instance_methods' do
  #   it '.average_pet_age' do
  #     pet_1 = Pet.create(image: "/", name: "Spot", approx_age: 4, sex: "Male",
  #     sheltered_at: "Happy Hills", description: "Good dog.", status: "Adoptable")
  #     pet_2 = Pet.create(image: "/", name: "Patch", approx_age: 5, sex: "Male",
  #     sheltered_at: "Happy Hills", description: "Good dog.", status: "Adoptable")
  #     happy_hills = Shelter.create(name:"Happy Hills",
  #                            address: "300 Street")
  #     expect(happy_hills.average_pet_age).to eq(4.5)
  #   end
  # end
end
