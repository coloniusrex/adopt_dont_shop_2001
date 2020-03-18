require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see all shelters and addresses" do
    shelter_1 = Shelter.create(name: "Happy Hills Shelter",
                              address: "1234 Miracle St., Denver, CO")
    shelter_2 = Shelter.create(name: "Sunbound Shelter",
                              address: "456 Roundabout Lane")

    visit "/shelters"
    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content("Address: #{shelter_1.address}")
    expect(page).to have_content(shelter_2.name)
    expect(page).to have_content("Address: #{shelter_2.address}")
  end
end
