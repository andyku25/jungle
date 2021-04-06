require 'rails_helper'

RSpec.feature "Visits a product page", type: :feature, js: true do
  before :each do
    @category = Category.create! name: "Apparel"

    2.times do
      @category.products.create!(
        name: Faker::Hipster.sentence(2),
        description: Faker::Hipster.paragraph(6),
        image: open_asset("apparel2.jpg"),
        quantity: 20,
        price: 49.99
      )
    end
  end
  
  scenario "Sees the details of the product" do
    visit root_path
    click_link("Details", match: :first)

    expect(page).to have_css("article.product-detail")
    
    save_screenshot "Test2_product_details.png" # Screenshot is slow
  end

end
