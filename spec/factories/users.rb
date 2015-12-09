FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'PaS$w0rd'
    password_confirmation 'PaS$w0rd'
  end
end