require "spec_helper"

describe News do
  let (:news) { create(:news) }
  let (:will) { create(:root_user, username: "will") }
  let (:jazz) { create(:root_user, username: "jazz") }

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
    it { expect(news).to validate_length_of(:content).is_at_least(1).is_at_most(100000) }
  end
  describe "friendly_id" do
    it "updates the slug when the title changes" do
      news.title = "The Fresh Prince of Bel Air"
      news.save!
      expect(news.slug).to eq("the-fresh-prince-of-bel-air")
    end
  end
  describe "acts_as_taggable" do
    it "manages tags" do
      news.tag_list.add(["jeff", "will", "smith"])
      news.tag_list.remove "jeff"
      expect(news.tag_list).to include("will")
      expect(news.tag_list).to_not include("jeff")
    end
    it "manages user tags" do
      will.tag(news, with: "vivian", on: :tags)
      jazz.tag(news, with: "ladies", on: :tags)
      expect(news.tags.where("taggings.tagger_id": jazz.id).first.name).to eq("ladies")
      expect(news.tags.where("taggings.tagger_id": will.id).first.name).to eq("vivian")
    end
  end
end
