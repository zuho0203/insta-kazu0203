FactoryBot.define do
    factory :user do
      account { Faker::Name.unique.name }
      email { Faker::Internet.unique.email }
      password { 'password' }
  
      trait :with_profile do
        after :build do |user|
          build(:profile, user: user)
        end
      end
    end
  end