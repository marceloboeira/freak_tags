require "spec_helper"

describe ApplicationHelper do
  describe "#page_title" do
    it "returns freaktags translated name" do
      expect(helper.page_title).to eq t(:freaktags)
    end
  end
end
