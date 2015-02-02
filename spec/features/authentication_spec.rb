require 'spec_helper'

describe "Authentication", :type => :feature, :js => true  do
  let (:petter) { FactoryGirl.create(:confirmed_user, username: "petter", password: 'side-boobs', name: "Petter Griffin") }

   it "sign in with email" do
    visit new_user_session_path
    fill_in 'Login', with: petter.email
    fill_in 'Password', with: petter.password
    find("div.actions input[type='submit']").click
    expect(page).to have_content(" #{petter.name} Signed in successfully")
  end
end
