require "spec_helper"

describe "Paranoid" do

  let (:paranoid) { create(:news) } #FIX Use a example created model to test

  it "soft destroy a record" do
    expect(paranoid.deleted_at).to be_nil
    paranoid.destroy
    expect(paranoid).to be_deleted
    expect(paranoid.deleted_at).to be_between(5.seconds.ago, DateTime.now)
  end
  it "restore a record" do
    id = paranoid.id.to_i
    paranoid.destroy
    expect(paranoid).to be_deleted
    News.restore(id)
    paranoid = News.find(id)
    expect(paranoid).to_not be_deleted
    expect(paranoid.deleted_at).to be_nil
  end
  it "really destroy a record" do
    id = paranoid.id.to_i
    paranoid.really_destroy!
    expect{
      News.with_deleted.find(id)
    }.to raise_error ActiveRecord::RecordNotFound
  end
end
