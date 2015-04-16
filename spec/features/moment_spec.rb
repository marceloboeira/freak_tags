require "spec_helper"

describe "MomentJS", :type => :feature, :js => true  do
  let (:piper) { create(:confirmed_user, username: "piper") }
  let (:news) { create(:news) }

  before :each do
    login_as(piper)
  end
  it "validates a recent date-component" do
    news.created_at = DateTime.now
    news.save!
    visit news_index_path
    expect(page.evaluate_script("$('date:first').data('source')")).to eq news.created_at.to_time.to_i
    expect(page.evaluate_script("$('date:first').html()")).to eq "a few seconds ago"
  end
  it "validates a old date-component" do
    news.created_at = 3.hours.ago
    news.save!
    visit news_index_path
    expect(page.evaluate_script("$('date:first').data('source')")).to eq news.created_at.to_time.to_i
    expect(page.evaluate_script("$('date:first').html()")).to eq "3 hours ago"
  end
  it "validates a very old date-component" do
    news.created_at = 10.years.ago
    news.save!
    visit news_index_path
    expect(page.evaluate_script("$('date:first').data('source')")).to eq news.created_at.to_time.to_i
    expect(page.evaluate_script("$('date:first').html()")).to eq "10 years ago"
  end
end
