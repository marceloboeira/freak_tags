require "spec_helper"

describe "PublicActivity", :type => :feature, :js => true  do
  let (:timmy) { create(:confirmed_user, username: "timmy") }
  let (:vicky) { create(:confirmed_user, username: "vicky") }

  before :each do
    timmy.follow vicky
    vicky.follow timmy
    @news_vicky = create(:news, author: vicky)
    @news_timmy = create(:news, author: timmy)
    login_as(timmy)
  end

  describe "dashboard shows published news" do
    it "from a friend and not himself" do
      visit dashboard_path
      within "#dashboard-activities" do
        expect(page).to have_content(vicky.username)
        expect(page).to have_content(@news_vicky.title.truncate(60))
        expect(page).to have_content("published") # TODO: Use I18n instead
        expect(page).to have_content(timmy.username)
        expect(page).to_not have_content(@news_timmy.title.truncate(60))
      end
    end
  end
  describe "profile page shows published news" do
    it "by himself" do
      visit profile_path(timmy.username)
      within "#tab-user-activity" do
        expect(page).to have_content(timmy.username)
        expect(page).to have_content(@news_timmy.title.truncate(60))
        expect(page).to have_content("published") # TODO: Use I18n instead
        expect(page).to have_content(vicky.username)
        expect(page).to_not have_content(@news_vicky.title.truncate(60))
      end
    end
  end
end
