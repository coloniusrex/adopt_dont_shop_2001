require 'rails_helper'

RSpec.describe "As a visitor" do
  it "I can update a shelter's info" do
    happy_hills = Shelter.create(name:"Happy Hills",
                           address: "300 Street")
    sunny_valley = Shelter.create(name: "Sunny Valley",
                                address: "400 Street")

    visit "/shelters/#{happy_hills.id}"
    expect(page).to have_button('Edit')
    click_on 'Edit'

    expect(current_path).to eq("/shelters/#{happy_hills.id}/edit")

    fill_in 'Name', with: 'Happier Hills'
    click_on 'Update Shelter'

    expect(current_path).to eq("/shelters/#{happy_hills.id}")
    expect(page).to have_content('Happier Hills')
    expect(page).to_not have_content('Happy Hills')
  end
end
