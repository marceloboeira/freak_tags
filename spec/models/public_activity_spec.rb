require "spec_helper"


PublicActivity.with_tracking do
  describe "PublicActivity::Activity" do
    let (:sherlock) { create(:root_user, username: "sherlock-holmes") }
    let (:watson) { create(:root_user, username: "john-watson") }
    let (:moriarty) { create(:root_user, username: "james-moriarty") }

    before :each do
      watson.invite sherlock
      sherlock.approve watson

      # It must be created here in order to create PublicActivity records, don't know why exactly
      @first_news = create(:news, author: sherlock)
      @second_news = create(:news, author: watson)
      @activities = PublicActivity::Activity.all
    end
    describe "validates" do
      it "attributes" do
        expect(@activities.first.owner).to eq(sherlock)
        expect(@activities.first.trackable).to eq(@first_news)
        expect(@activities.last.owner).to eq(watson)
        expect(@activities.last.trackable).to eq(@second_news)
        @activities.each do |activity|
          expect(activity.created_at).to be_between(5.seconds.ago, DateTime.now)
        end
      end
      it "self activities" do
        expect(sherlock.activities).to include @activities.first
        expect(sherlock.activities).to_not include @activities.last
        expect(watson.activities).to include @activities.last
        expect(watson.activities).to_not include @activities.first
      end
      it "friends activities" do
        expect(sherlock.friends_activities).to include @activities.last
        expect(watson.friends_activities).to include @activities.first
        expect(moriarty.friends_activities).to_not include @activities
      end
    end
  end
end

