require 'rails_helper'

RSpec.describe Product, type: :model do

  it "is valid with valid attributes" do
    expect(build(:product)).to be_valid
  end

  it "is not valid with invalid arrributes" do
    expect(build(:product, title: nil)).not_to be_valid
  end

end
