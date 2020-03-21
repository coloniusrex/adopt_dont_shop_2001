require 'rails_helper'

RSpec.describe "As a visitor" do
  it "I can destroy a shelter" do
    happy_hills = Shelter.create(name:"Happy Hills",
                           address: "300 Street")
    sunny_valley = Shelter.create(name: "Sunny Valley",
                                address: "400 Street")

    visit '/shelters'
    expect(page).to have_content(happy_hills.name)
    expect(page).to have_content(sunny_valley.name)

    visit "/shelters/#{happy_hills.id}"

    click_on 'Delete'

    expect(current_path).to eq('/shelters')
    expect(page).to_not have_content(happy_hills.name)
    expect(page).to have_content(sunny_valley.name)

  end
end
