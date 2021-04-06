require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  before :each do
    @user = User.create!(
      first_name: "Harry",
      last_name: "Potter",
      email: "HP@hogwarts.com",
      password: "magician",
      password_confirmation: "magician"
    )
  end

  scenario "Visit login page and enter credentials to login. confirm logged in where nav includes 'logout' path" do
    visit login_path
    fill_in "email", with: "hp@hogwarts.com"
    fill_in "password", with: "magician"

    save_screenshot "Test4_user_login_fill.png"
    
    click_button("Login")
    save_screenshot "Test4_user_login_submit.png"

    expect(page).to have_text("Logout")

  end
end
