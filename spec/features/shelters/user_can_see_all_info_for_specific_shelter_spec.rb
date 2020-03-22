require 'rails_helper'

RSpec.describe "shelter id page", type: :feature do
  it "can see all info for specific shelter id" do
    shelter_1 = Shelter.create(name: "Happy Hills Shelter",
                          address: "1234 Miracle St.",
                             city: "Denver",
                            state: "CO",
                              zip: "80203")
    visit 'shelters/'

    click_on 'Shelter Info'

    expect(current_path).to eq("/shelters/#{shelter_1.id}")

    expect(page).to have_content(shelter_1.id)
    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip)

  end
end
