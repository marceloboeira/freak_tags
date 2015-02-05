require "spec_helper"

class FakeModel
  include ActiveModel::Validations
  attr_accessor :username
  validates :username, username: true
end

describe UsernameValidator do

  let (:fake_model) { FakeModel.new }

  it "accepts underscore, hyphen, uppercase, lowercase and numbers" do
    expect(fake_model).to allow_value("jerry_seinfeld", "elaine_baines_9", "_CosMo23", "_newman_7","george-constanza", "UncLE-LeO-", "-CosmO-KrameR", "George_Cons-tanza99", "elaINE_-baines").for(:username)
  end

  it "rejects url unsafe chars, dots" do
    expect(fake_model).to_not allow_value("!george", "elaine#baines", "jerry%9", "ass^man", "kram.3r", "el@ine", "$constanza", "newman*", "soup?").for(:username)
  end
end
