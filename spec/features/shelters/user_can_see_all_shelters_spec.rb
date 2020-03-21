require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see all shelters and addresses" do
    shelter_1 = Shelter.create(name: "Happy Hills Shelter",
                            address: "1234 Miracle St.",
                               city: "Denver",
                              state: "CO",
                                zip: "80203")
    shelter_2 = Shelter.create(name: "Happy Hills Shelter",
                            address: "1234 Happy St.",
                               city: "Englewood",
                              state: "CO",
                                zip: "80212")

    visit '/shelters'
    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end
end
