require "spec_helper"

describe News do

  let (:news) { create(:news) }

  before :each do
    create(:news)
  end

  describe "validates" do
    it "a valid factory" do
      expect(news).to be_valid
    end
    it { expect(news).to validate_presence_of(:title) }
    it { expect(news).to validate_presence_of(:slug_line) }
    it { expect(news).to validate_presence_of(:content) }
    it { expect(news).to validate_presence_of(:author) }
    it { expect(news).to validate_length_of(:title).is_at_least(5).is_at_most(150) }
    it { expect(news).to validate_length_of(:slug_line).is_at_least(20).is_at_most(150) }
    it { expect(news).to validate_length_of(:content).is_at_least(1).is_at_most(1000) }
  end
  describe "friendly_id" do
    it "updates the slug when the title changes" do
      news.title = "The Fresh Prince of Bel Air"
      news.save!
      expect(news.slug).to eq("the-fresh-prince-of-bel-air")
    end
  end
end
