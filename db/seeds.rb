Reply.destroy_all
Post.destroy_all
Movie.destroy_all
ChatRoom.destroy_all
User.destroy_all


# Create users
user1 = User.create!(email: "user1@gmail.com", password: "123456", nickname: "user1")
user2 = User.create!(email: "user2@gmail.com", password: "123456", nickname: "user2")
user3 = User.create!(email: "user3@gmail.com", password: "123456", nickname: "user3")


m1 = Movie.new(title: "Star wars IV",
              rating: 8.7,
              year: 1977)
m1.save
c1 = ChatRoom.create(movie_id: m1.id)
m2 = Movie.new(title: "Back to the future",
              rating: 8.5,
              year: 1985)
m2.save
c2 = ChatRoom.create(movie_id: m2.id)
m3 = Movie.new(title: "The Matrix",
              rating: 8.7,
              year: 1999)
m3.save
c3 = ChatRoom.create(movie_id: m3.id)

p1 = Post.new(content: "This is the first post of the first chat room",chat_room_id: c1.id, user_id: user1.id)
p1.save
p2 = Post.new(content: "This is the second post of the first chat room",chat_room_id: c1.id, user_id: user2.id)
p2.save

p3 = Post.new(content: "This is the first post of the second chat room",chat_room_id: c2.id, user_id: user1.id)
p3.save
p4 = Post.new(content: "This is the second post of the second chat room",chat_room_id: c2.id, user_id: user2.id)
p4.save

p5 = Post.new(content: "This is the first post of the third chat room",chat_room_id: c3.id, user_id: user1.id)
p5.save
p6 = Post.new(content: "This is the second post of the third chat room",chat_room_id: c3.id, user_id: user2.id)
p6.save

r1 = Reply.new(content: "This is the first reply of the first post of the first chat room",post_id: p1.id, user_id: user3.id)
r1.save
r2 = Reply.new(content: "This is the second reply of the first post of the first chat room",post_id: p1.id, user_id: user1.id)
r2.save

r3 = Reply.new(content: "This is the first reply of the first post of the second chat room",post_id: p3.id, user_id: user3.id)
r3.save
r4 = Reply.new(content: "This is the second reply of the first post of the second chat room",post_id: p3.id, user_id: user1.id)
r4.save
