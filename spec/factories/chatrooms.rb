FactoryBot.define do
  factory :chatroom do
    sequence(:slug) { |n| "Chatroom#{n}"}
    topic 'Chatroom topic'
  end
end
