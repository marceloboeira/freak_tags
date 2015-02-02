require "spec_helper"

describe FontAwesomeHelper do
  describe "#fa" do
    it "returns default fa-question icon when is null" do
      expect(helper.fa).to eq "<i class=\"fa fa-question\"></i>"
    end

    it "returns a specific icon" do
      expect(helper.fa "dashboard").to eq "<i class=\"fa fa-dashboard\"></i>"
    end

    it "returns valid classes" do
      expect(helper.fa "dashboard", :class => "breaking-bad").to eq "<i class=\"fa fa-dashboard breaking-bad\"></i>"
    end

    it "returns icons labels" do
      expect(helper.fa "dashboard", :text => "rookie-blue").to eq "<i class=\"fa fa-dashboard\"></i> rookie-blue"
    end

    it "returns icons labels at left" do
      expect(helper.fa "dashboard", { :text => "the-office", :left => true}).to eq "the-office <i class=\"fa fa-dashboard\"></i>"
    end
  end
end
