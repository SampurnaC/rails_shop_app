FactoryBot.define do
  # factory :user do
  #   email { Faker::Internet.email }
  #   password { "password" }

  #   trait :admin do
  #     role { "admin" }
  #   end
  # end

  factory :user do
    email { Faker::Internet.email }
    password { "password" }
    role {"admin"}
    
  end

end
