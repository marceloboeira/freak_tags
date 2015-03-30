require "spec_helper"

describe "News", :type => :feature, :js => true  do
  let (:dexter) { create(:confirmed_user, role: UserRole::MODERATOR) }
  let (:rita) { create(:confirmed_user, role: UserRole::CONTRIBUTOR) }
  let (:debra) { create(:confirmed_user, role: UserRole::REGULAR) }
  let (:killer_news) { create(:news, author: dexter) }

  describe "permissions" do
    describe "regular" do
      before :each do
        login_as(debra)
      end
      it "is allowed to view" do
        view_news
      end
      it "is not allowed to create, update or delete" do
        check_unauthorized([new_news_path, edit_news_path(killer_news),destroy_news_path(killer_news)])
      end
    end
    describe "contributor" do
      before :each do
        login_as(rita)
      end
      it "is allowed to view and create" do
        view_news
        create_news(rita)
      end
      it "is not allowed to update and delete" do
        check_unauthorized([edit_news_path(killer_news),destroy_news_path(killer_news)])
      end
    end
    describe "moderator" do
      before :each do
        before_date = DateTime.now
        login_as(dexter)
      end
      it "is allowed to create, view, update, destroy" do
        create_news(dexter)
        view_news
        update_news
        destroy_news
      end
    end
  end
  describe "friendly-id" do
    before :each do
      login_as(dexter)
    end
    it "updates slug when the title changes" do
      new_title = "Another Killer title"
      old_path = news_path(killer_news)
      visit edit_news_path(killer_news)
      within("form.edit_news") do
        fill_in "Title", with: new_title
        click_on "Update"
      end
      killer_news.reload
      [news_path(killer_news), old_path].each do |this_path|
        visit this_path
        expect(page).to have_content(new_title)
      end
    end
  end


  private

  def create_news(user)
    visit new_news_path
    within("form.new_news") do
      first("input#news_title").set("The IceTruck Killer strikes again")
      first("input#news_slug_line").set("Miami police confirm that the IceTruck Killer, AKA ICT, has killed again")
      first("input#news_content", visible: false).set("<b> Kill'em All </b>")
      click_on "Create"
    end
    news = News.all.last
    expect(news.created_at).to be_between(5.seconds.ago, DateTime.now)
    expect(news.slug).to eq("the-icetruck-killer-strikes-again")
    expect(news.title).to have_content("IceTruck Killer")
    expect(news.author).to eq(user)
    expect(current_path).to eq(news_path(news))
  end

  def view_news
    visit news_path(killer_news)
    expect(page).to have_content(killer_news.title)
  end

  def update_news
    new_slug_line = "Tonight's the night. And it's going to happen again and again. It has to happen."
    visit edit_news_path(killer_news)
    within("form.edit_news") do
      first("input#news_slug_line").set(new_slug_line)
      click_on "Update"
    end
    killer_news.reload
    expect(killer_news.slug_line).to eq(new_slug_line)
    expect(killer_news.updated_at).to be_between(5.seconds.ago, DateTime.now)
    expect(current_path).to eq(news_path(killer_news))
  end

  def destroy_news
    visit destroy_news_path(killer_news)
    killer_news.reload
    expect(killer_news).to be_deleted
    expect(killer_news.deleted_at).to be_between(5.seconds.ago, DateTime.now)
    expect(current_path).to eq news_index_path
  end

  def check_unauthorized(paths = [])
    paths.each do |path|
      visit path
      expect(current_path).to eq dashboard_path
      expect(page).to have_content("You are not authorized to access this page.")
    end
  end
end
