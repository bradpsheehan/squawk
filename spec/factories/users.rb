FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@example.com"}
    sequence(:first_name) { |n| "Jane#{n}"}
    sequence(:last_name) { |n| "Doe#{n}"}
    sequence(:username) { |n| "Doe#{n}"}
    password 'Mypassword123'
  end
end
