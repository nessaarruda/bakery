require 'rails_helper'

describe 'As a visitor when I visit the index page' do
  before :each do
    @baker_1 = Baker.create!(name: "Michi")
    @baker_2 = Baker.create!(name: "V")
    @baker_3 = Baker.create!(name: "Tom")
    @baker_4 = Baker.create!(name: "Monica")
    @baker_5 = Baker.create!(name: "Rachel")
    @baker_6 = Baker.create!(name: "Ross")

    visit bakers_path
  end
  
  it 'Lists all bakers names with links to show pages' do
    expect(page).to have_link(@baker_1.name)
    expect(page).to have_link(@baker_2.name)
    expect(page).to have_link(@baker_3.name)
    expect(page).to have_link(@baker_4.name)
    expect(page).to have_link(@baker_5.name)
    expect(page).to have_link(@baker_6.name)

    click_on @baker_1.name

    expect(current_path).to eq(baker_path(@baker_1))
  end
end
