require 'rails_helper'

RSpec.describe Category, type: :model do

  it "is valid with valid attributes" do
    expect(build(:category)).to be_valid
  end

  it "is not valid with valid attributes" do
    expect(build(:category, name: nil)).to_not be_valid
  end

end
