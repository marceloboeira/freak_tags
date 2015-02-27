require "spec_helper"

describe "News", :type => :feature, :js => true  do
  let (:dexter) { create(:confirmed_user, role: UserRole::MODERATOR) }
  let (:debra) { create(:confirmed_user, role: UserRole::REGULAR) }
  let (:killer_news) { create(:news, author: dexter) }

  describe "regular user can" do
    before :each do
      login_as(debra)
    end
    it "view" do
      visit news_path(killer_news)
      expect(page).to have_content(killer_news.title)
    end
    it "not create, update or delete" do
      visit new_news_path
      [new_news_path, edit_news_path(killer_news),destroy_news_path(killer_news)].each do
        expect(current_path).to eq dashboard_path
        expect(page).to have_content("You are not authorized to access this page.")
      end
    end
  end
  describe "moderator user can" do
    before :each do
      before_date = DateTime.now
      login_as(dexter)
    end
    it "create" do
      visit new_news_path
      within("form.new_news") do
        fill_in "Title", with: "The IceTruck Killer strikes again"
        fill_in "Slug line", with: "Miami police confirm that the IceTruck Killer, AKA ICT, has killed again"
        fill_in "Content", with: "<b> Kill'em All </b>"
        click_on "Create"
      end
      news = News.all.last
      expect(news.created_at).to be_between(5.seconds.ago, DateTime.now)
      expect(news.title).to have_content("IceTruck Killer")
      expect(current_path).to eq(news_path(news))
    end
    it "view" do
      visit news_path(killer_news)
      expect(page).to have_content(killer_news.title)
    end
    it "update" do
      new_slug_line = "tonight is the night, and is going to happen again, it has to happen..."
      visit edit_news_path(killer_news)
      within("form.edit_news") do
        fill_in "Slug line", with: new_slug_line
        click_on "Update"
      end
      killer_news.reload
      expect(killer_news.slug_line).to eq(new_slug_line)
      expect(killer_news.updated_at).to be_between(5.seconds.ago, DateTime.now)
      expect(current_path).to eq(news_path(killer_news))
    end
    it "destroy" do
      visit destroy_news_path(killer_news)
      killer_news.reload
      expect(killer_news).to be_deleted
      expect(killer_news.deleted_at).to be_between(5.seconds.ago, DateTime.now)
      expect(current_path).to eq news_index_path
    end
  end

  private

  def create_news
  end

  def update_news
  end
end
