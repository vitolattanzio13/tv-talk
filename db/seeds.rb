require "json"
require "open-uri"

Reply.destroy_all
Post.destroy_all
ChatRoom.destroy_all
Movie.destroy_all
User.destroy_all

def get_movie(title)
  result = {}
  result[:title] = title
  title = title.gsub(" ", "+")
  title = title.gsub(":", "%3A")
  url = "http://www.omdbapi.com/?t=#{title}&plot=full&apikey=#{ENV.fetch('OMDB_API_KEY')}"
  movie_serialized = URI.open(url).read
  movie = JSON.parse(movie_serialized)
  result[:poster_url] = movie["Poster"]
  result[:imdb_id] = movie["imdbID"]
  result[:media_type] = movie["Type"]
  result[:plot_long] = movie["Plot"]
  result[:year] = movie["Year"]
  result[:rating] = movie["imdbRating"]
  result[:genre] = movie["Genre"]
  result[:director] = movie["Director"]
  result[:actors] = movie["Actors"]
  result
end

# Create users
user1 = User.create!(email: "user1@gmail.com", password: "123456", nickname: "user1")
user2 = User.create!(email: "user2@gmail.com", password: "123456", nickname: "user2")
user3 = User.create!(email: "user3@gmail.com", password: "123456", nickname: "user3")

title = "Star wars: Episode IV"
movie = get_movie(title)
m1 = Movie.new(movie)
m1.trailer_url = "https://www.youtube.com/embed/vZ734NWnAHA"
m1.save!
c1 = ChatRoom.create(movie_id: m1.id)

title = "Back to the future"
movie = get_movie(title)
m2 = Movie.new(movie)
m2.trailer_url = "https://www.youtube.com/embed/qvsgGtivCgs"
m2.save!
c2 = ChatRoom.create(movie_id: m2.id)

title = "The Godfather"
movie = get_movie(title)
m3 = Movie.new(movie)
m3.trailer_url = "https://www.youtube.com/embed/sY1S34973zA"
m3.save!
c3 = ChatRoom.create(movie_id: m3.id)

title = "Game of thrones"
movie = get_movie(title)
movie = Movie.new(movie)
movie.trailer_url = "https://www.youtube.com/embed/gcTkNV5Vg1E"
movie.save!
ChatRoom.create(movie_id: movie.id)


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
