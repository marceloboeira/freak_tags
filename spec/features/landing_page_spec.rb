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
end
