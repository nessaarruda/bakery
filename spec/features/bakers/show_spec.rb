require 'rails_helper'

describe 'As a visitor when I visit the show page' do
  before :each do
    @baker_1 = Baker.create!(name: "Michi")
    @baker_2 = Baker.create!(name: "V")
    @baker_3 = Baker.create!(name: "Tom")
    @baker_4 = Baker.create!(name: "Monica")
    @baker_5 = Baker.create!(name: "Rachel")
    @baker_6 = Baker.create!(name: "Ross")

    @recipe_1 = @baker_1.recipes.create!(name: 'Risotto', number_ingredients: 5, bake_time: 1, oven_temp: 0)
    @recipe_2 = @baker_1.recipes.create!(name: 'Beef', number_ingredients: 2, bake_time: 1, oven_temp: 350)
    @recipe_3 = @baker_1.recipes.create!(name: 'Pasta', number_ingredients: 5, bake_time: 2, oven_temp: 375)

    visit baker_path(@baker_1)
  end
  it 'Shows baker name and all their recipes with a link to the recipe show page' do

    expect(page).to have_content(@baker_1.name)
    expect(page).to have_link(@recipe_1.name)
    expect(page).to have_link(@recipe_2.name)
    expect(page).to have_link(@recipe_3.name)

    click_on @recipe_1.name

    expect(current_path).to eq(recipe_path(@recipe_1))
  end
end
