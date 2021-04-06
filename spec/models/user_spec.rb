require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "should be valid with all fields passed in as expected" do
      @user = User.new(
        first_name: "John",
        last_name: "Dough",
        email: "John@Dough.com",
        password: "doughy",
        password_confirmation: "doughy",
      )
      @user.save
      expect(@user).to be_valid
    end

    it "should return error when password fields don't match" do
      @user = User.new(
        first_name: "John",
        last_name: "Dough",
        email: "John@Dough.com",
        password: "doughy",
        password_confirmation: "daugh",
      )
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "should return error when email created already exists in the database" do
      @user1 = User.new(
        first_name: "John",
        last_name: "Dough",
        email: "John@Dough.com",
        password: "doughy",
        password_confirmation: "doughy",
      )
      @user2 = User.new(
        first_name: "Jane",
        last_name: "Dough",
        email: "John@Dough.COM",
        password: "doughy",
        password_confirmation: "doughy",
      )
      @user1.save
      @user2.save
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it "should return error when password is less than 6 characters" do
      @user = User.new(
        first_name: "John",
        last_name: "Dough",
        email: "John@Dough.com",
        password: "dough",
        password_confirmation: "dough",
      )
      @user.save
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end

  describe ".authenticate_with_credentials" do
    it "should return the user when valid email and password is passed" do
      @user = User.new(
        first_name: "Joseph",
        last_name: "Tribbiani",
        email: "pizza@food.com",
        password: "mmmsoup",
        password_confirmation: "mmmsoup"
      )
      @user.save
      expect(User.authenticate_with_credentials("pizza@food.com", "mmmsoup")).to eq(@user)
    end

    it "should return the nil when email is not authenticated" do
      @user = User.new(
        first_name: "Joseph",
        last_name: "Tribbiani",
        email: "pizzaaa@food.com",
        password: "mmmsoup",
        password_confirmation: "mmmsoup"
      )
      @user.save
      expect(User.authenticate_with_credentials("pizza@food.com", "mmmsoup")).to be_nil
    end

    it "should return the user when email include additional whitespaces" do
      @user = User.new(
        first_name: "Johnny",
        last_name: "Rose",
        email: "example@domain.com",
        password: "screek",
        password_confirmation: "screek"
      )
      @user.save
      expect(User.authenticate_with_credentials(" example@domain.com ", "screek")).to eq(@user)
    end

    it "should return the user when email is in different case" do
      @user = User.new(
        first_name: "Johnny",
        last_name: "Rose",
        email: "example@domain.com",
        password: "screek",
        password_confirmation: "screek"
      )
      @user.save
      expect(User.authenticate_with_credentials("exAmple@domaiN.cOM", "screek")).to eq(@user)
    end
  end

end
