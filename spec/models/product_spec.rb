require 'rails_helper'

RSpec.describe Product, type: :model do

  let(:user) {User.create(email: "test@test.com", password: "123456", password_confirmation: "123456")}
  let(:category){Category.create(name: "dammi category")}

  it "is valid with valid attributes" do
    product=Product.new(title: "dammi product", price: 100, user: user, category: category)
    expect(product).to be_valid
  end

  it "is not valid with invalid arrributes" do
    product=Product.new(price: 100, user: user, category: category)
    expect(product).to_not be_valid
  end

end
