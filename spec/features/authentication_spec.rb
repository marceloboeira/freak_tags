require 'spec_helper'

describe "Authentication", :type => :feature, :js => true  do
  let (:jack) { FactoryGirl.create(:user, username: "jack") }

   it "sign in with email" do
    visit new_user_session_path
    fill_in 'Login', with:jack.email
    fill_in 'Password', with:jack.password
    find("div.actions input[type='submit']").click
    expect(page).to have_content("confirmation")
  end
end
