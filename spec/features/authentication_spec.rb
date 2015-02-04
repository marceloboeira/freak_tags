require 'spec_helper'

describe "Authentication", :type => :feature, :js => true  do
  let (:petter) { create(:confirmed_user, username: "petter", password: 'side-boobs', name: "Petter Griffin") }
  let (:louis) { create(:female_user, username: "louis", password: 'i-feel-alive', name: "Louis Griffin") }
  let (:chris) { User.new(username: "chris-griffin", email: "chris.griffin@gmail.com", password: "everybody-hates-meg")}

  describe "sign-up" do
    #it "allow normal params" do
    #  sign_up_with(chris.username, chris.email, chris.password, chris.password)
    #  # TODO: Find out why the page is redirecting to home
    #  expect(page).to have_content(I18n.t(:"devise.registrations.signed_up"))
    #  expect(chris.created_at).to be_between(5.minutes.ago, DateTime.now)
    #end
    describe "don't allow" do
      it "null params" do
        sign_up_with('', '', '', '')
        expect(page).to have_content("Username can't be blank")
        expect(page).to have_content("Email can't be blank")
        expect(page).to have_content("Password can't be blank")
      end
      it "wrong confirmation" do
        sign_up_with(chris.username, chris.email, chris.password, "woooops10000")
        expect(page).to have_content("Password confirmation doesn't match Password")
      end
      it "invalid email" do
        sign_up_with(chris.username, "invalid-mail", chris.password, chris.password)
        expect(page).to have_content("Email is invalid")
      end
    end
  end
  describe "sign-in" do
    describe "allow" do
      it "email as login" do
        sign_in_with(petter.email, petter.password)
        expect(page).to have_content(I18n.t :"devise.sessions.signed_in")
      end
      it "username as login" do
        sign_in_with(petter.username, petter.password)
        expect(page).to have_content(I18n.t :"devise.sessions.signed_in")
      end
    end
    describe "don't allow" do
      it "wrong information" do
        sign_in_with(petter.username, "invalid-password")
        expect(page).to have_content(I18n.t(:"devise.failure.invalid", authentication_keys: "login"))
      end
      it "non-confirmed users" do
        sign_in_with(louis.username, louis.password)
        expect(page).to have_content(I18n.t :"devise.failure.unconfirmed")
      end
    end
  end

  private
  def sign_in_with(login, password)
    visit new_user_session_path
    within("form#new_user") do
      fill_in 'Login', with: login
      fill_in 'Password', with: password
      click_on 'Sign in'
    end
  end
  def sign_up_with(username, email, password, confirmation)
    visit new_user_registration_path
    within("form#new_user") do
      fill_in 'Username', with: username
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: confirmation
      click_on 'Sign up'
    end
  end
end
