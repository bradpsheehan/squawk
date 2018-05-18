# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


raw_chatroom_data = [{ slug: 'General',
                       topic: 'A chatroom for general information'
                     },
                     { slug: 'Random',
                       topic: 'A chatroom for random information'
                     }]

raw_user_data = [{ username: 'jane22',
                   email: 'jdoe22@example.com',
                   first_name: 'Jane',
                   last_name: 'Doe',
                   password: 'Testtest123'
                 },
                 { username: 'john44',
                   email: 'jdoe44@example.com',
                   first_name: 'John',
                   last_name: 'Doe',
                   password: 'Testtest123'
                 }]

chatrooms = raw_chatroom_data.map do |room|
  p "Creating chatroom: ##{room[:slug]}"
  Chatroom.where(slug: room[:slug]).first_or_create(room)
end

users = raw_user_data.map do |user|
  p "Creating user: #{user[:username]}"
  User.where(username: user[:username]).first_or_create(user)
end

Message.create(content: "Good morning ##{chatrooms.first.slug}", user: users.first, chatroom: chatrooms.first)
Message.create(content: "Good morning ##{chatrooms.last.slug}", user: users.first, chatroom: chatrooms.last)

Message.create(content: "Hello world ##{chatrooms.first.slug}", user: users.last, chatroom: chatrooms.first)
Message.create(content: "Hello world ##{chatrooms.last.slug}", user: users.last, chatroom: chatrooms.last)





















