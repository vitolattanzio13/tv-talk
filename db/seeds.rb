require "json"
require "open-uri"
require "nokogiri"
Newspaper.destroy_all
Reply.destroy_all
Post.destroy_all
ChatRoom.destroy_all
Movie.destroy_all
User.destroy_all

def format_result(movie, mtitle)
  {
    title: mtitle, poster_url: movie["Poster"],
    imdb_id: movie["imdbID"], media_type: movie["Type"],
    plot_long: movie["Plot"],
    year: movie["Year"],
    rating: movie["imdbRating"],
    genre: movie["Genre"],
    director: movie["Director"],
    actors: movie["Actors"]
  }
end

def get_movie(mtitle)
  title = mtitle
  mtitle = mtitle.gsub(" ", "+")
  mtitle = mtitle.gsub(":", "%3A")
  url = "http://www.omdbapi.com/?t=#{mtitle}&plot=full&apikey=#{ENV.fetch('OMDB_API_KEY')}"
  movie_serialized = URI.open(url).read
  movie = JSON.parse(movie_serialized)
  format_result(movie, title)
end

# Create users
user1 = User.create!(email: "user1@gmail.com", password: "123456", nickname: "user1")
user2 = User.create!(email: "user2@gmail.com", password: "123456", nickname: "user2")
user3 = User.create!(email: "user3@gmail.com", password: "123456", nickname: "user3")

# Create movies

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

# Create posts

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

# News articles

url = "https://www.empireonline.com/movies/news/"

html_file = URI.open(url).read
html_doc = Nokogiri::HTML(html_file)
titles = []
links = []
html_doc.search("a.jsx-2519753491.title").each do |element|
  # title
  titles << element.text.strip
  # link
  links << element.attribute("href").value
end
descriptions = []
html_doc.search("a.description").each do |element|
  # description
  descriptions << element.text.strip
end
imgs = []
html_doc.search("img.jsx-952983560.loading").each do |element|
  # img_url
  link = element.attribute("data-src").value
  img_links = link.split("?")
  imgs << img_links[0]
end

link_url = "https://www.empireonline.com"

titles.each_with_index do |ntitle, index|
  Newspaper.create(title: ntitle, content: descriptions[index], url: link_url + links[index], image_url: "https:#{imgs[index]}")
end
