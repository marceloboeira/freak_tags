require "spec_helper"

describe "PublicActivity::Activity" do
  let (:sherlock) { create(:root_user, username: "sherlock-holmes") }
  let (:watson) { create(:root_user, username: "john-watson") }
  let (:moriarty) { create(:root_user, username: "james-moriarty") }
  before :each do
    sherlock.follow watson
    watson.follow sherlock
    # It must be created here in order to create PublicActivity records, don't know why exactly
    @first_news = create(:news, author: sherlock)
    @second_news = create(:news, author: watson)
    @activities = PublicActivity::Activity.all
  end
  describe "for news validates" do
    it "attributes and types" do
      # Follow
      [@activities.first, @activities.second].each do |activity|
        expect(activity.trackable.class).to be Follow
      end
      expect(@activities.first.trackable.followable).to eq watson
      expect(@activities.second.trackable.followable).to eq sherlock
      # News
      [@activities.third, @activities.fourth].each do |activity|
        expect(activity.trackable.class).to be News
      end
      expect(@activities.third.owner).to eq(sherlock)
      expect(@activities.third.trackable).to eq(@first_news)
      expect(@activities.fourth.owner).to eq(watson)
      expect(@activities.fourth.trackable).to eq(@second_news)
      @activities.each do |activity|
        expect(activity.created_at).to be_between(5.seconds.ago, DateTime.now)
      end
    end
    it "self activities" do
      [@activities.first, @activities.third].each do |activity|
        expect(sherlock.activities).to include activity
        expect(watson.activities).to_not include activity
      end
      [@activities.second, @activities.fourth].each do |activity|
        expect(watson.activities).to include activity
        expect(sherlock.activities).to_not include activity
      end
      expect(moriarty.activities).to be_empty
    end
    it "follows activities" do
      [@activities.first, @activities.third].each do |activity|
        expect(sherlock.follows_activities).to_not include activity
        expect(watson.follows_activities).to include activity
      end
      [@activities.second, @activities.fourth].each do |activity|
        expect(watson.follows_activities).to_not include activity
        expect(sherlock.follows_activities).to include activity
      end
      expect(moriarty.follows_activities).to be_empty
    end
  end
end

