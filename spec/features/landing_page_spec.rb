require 'spec_helper'

describe "Landing page", :type => :feature  do

   it "is the root_path" do
    visit root_path

    within 'div.intro-message h1' do
      expect(page).to have_content(I18n.t :freaktags)
    end
    within 'div.intro-message h3' do
      expect(page).to have_content(I18n.t :slug_line)
    end
  end

  it "visible only for non-logged users" do
    # Todo englobe this on a helper
    user = FactoryGirl.create(:confirmed_user)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit root_path
    expect(current_path).to eq(dashboard_path)
  end
end
