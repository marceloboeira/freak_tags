require "spec_helper"

class FakeModel
  include ActiveModel::Validations
  attr_accessor :name
  validates :name, full_name: true
end

describe FullNameValidator do

  let (:fake_model) { FakeModel.new }

  it "accepts normal names, dr., mr. and special chars" do
    expect(fake_model).to allow_value("Jerry Seinfeld", "Elaine Baines", "Cosmo Kramer", "Dr. Assman", "Mr. Constanza", "Kramer O'boo").for(:name)
  end

  it "rejects invalid names / invalid chars" do
    expect(fake_model).to_not allow_value("El@ine", "Kramer O\"boo", "KRAMER", "Mr, contanza", "SoUpNa zi").for(:name)
  end
end
