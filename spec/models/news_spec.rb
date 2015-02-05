require "spec_helper"

describe News do

  let (:news) { FactoryGirl.create(:news) }

  before :each do
    create(:news)
  end

  it "has a valid factory" do
    expect(news).to be_valid
  end

  it { expect(news).to validate_presence_of(:title) }
  it { expect(news).to validate_presence_of(:slug) }
  it { expect(news).to validate_presence_of(:slug_line) }
  it { expect(news).to validate_presence_of(:content) }
  it { expect(news).to validate_presence_of(:author) }
  it { expect(news).to validate_presence_of(:state) }

  it { expect(news).to validate_uniqueness_of(:slug) }

  # it { expect(news).to ensure_length_of(:).is_at_least(2).is_at_most(50) }

end
