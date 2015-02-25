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
    id = paranoid.id
    paranoid.destroy
    expect(paranoid).to be_deleted
    paranoid.restore(id)
    paranoid = paranoid.find(id)
    expect(paranoid).to_not be_deleted
    expect(paranoid.deleted_at).to be_nil
    expect(paranoid).to be_inactive
  end
  it "really destroy a record" do
    id = paranoid.id
    paranoid.really_destroy!
    paranoid = paranoid.find(id)
    expect(paranoid).to be_nil
  end
end
