require "spec_helper"

describe News do

  let (:news) { create(:news) }

  before :each do
    create(:news)
  end

  describe "validates" do
    it "has a valid factory" do
      expect(news).to be_valid
    end
    it { expect(news).to validate_presence_of(:title) }
    it { expect(news).to validate_presence_of(:slug_line) }
    it { expect(news).to validate_presence_of(:content) }
    it { expect(news).to validate_presence_of(:author) }
    it { expect(news).to validate_presence_of(:state) }
    it { expect(news).to validate_length_of(:title).is_at_least(5).is_at_most(150) }
    it { expect(news).to validate_length_of(:slug_line).is_at_least(20).is_at_most(150) }
    it { expect(news).to validate_length_of(:content).is_at_least(1).is_at_most(1000) }
  end
  describe "paranoid validates state for" do
    it "soft destroy" do
      expect(news.deleted_at).to be_nil
      news.destroy
      expect(news).to be_deleted
      expect(news.state).to eq State::DELETED
      expect(news.deleted_at).to be_between(5.seconds.ago, DateTime.now)
    end
    it "restore" do
      id = news.id
      news.destroy
      expect(news).to be_deleted
      News.restore(id)
      news = News.find(id)
      expect(news).to_not be_deleted
      expect(news.deleted_at).to be_nil
      expect(news).to be_inactive
    end
  end
end
