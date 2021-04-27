FactoryBot.define do
    factory :user do
      account { Faker::Name.unique.name }
      email { Faker::Internet.unique.email }
      password { 'password' }
    end
  end