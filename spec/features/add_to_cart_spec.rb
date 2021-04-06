require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  
  before :each do
    @category = Category.create! name: "Apparel"

    5.times do
      @category.products.create!(
        name: Faker::Hipster.sentence(2),
        description: Faker::Hipster.paragraph(4),
        image: open_asset("apparel3.jpg"),
        quantity: 20,
        price: 50.99,
      )
      
    end
  end
  
  scenario "click on 'add' btn to add product to shopping cart assert nav bar cart has increased by 1" do
    visit root_path

    click_button("Add", match: :first)
    
    save_screenshot "Test3_add_to_cart.png"

    expect(page).to have_text("My Cart (1)")
  end
end
