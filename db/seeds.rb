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

title = "Pulp Fiction"
movie = get_movie(title)
m4 = Movie.new(movie)
m4.trailer_url = "https://www.youtube.com/embed/s7EdQ4FqbhY"
m4.save!
ChatRoom.create(movie_id: m4.id)

title = "Kill Bill: Vol. 1"
movie = get_movie(title)
m5 = Movie.new(movie)
m5.trailer_url = "https://www.youtube.com/embed/7kSuas6mRpk"
m5.save!
ChatRoom.create(movie_id: m5.id)

title = "The Shawshank Redemption"
movie = get_movie(title)
m6 = Movie.new(movie)
m6.trailer_url = "https://www.youtube.com/embed/6hB3S9bIaco"
m6.save!
ChatRoom.create(movie_id: m6.id)

title = "The Lord of the Rings: The Fellowship of the Ring"
movie = get_movie(title)
m7 = Movie.new(movie)
m7.trailer_url = "https://www.youtube.com/embed/V75dMMIW2B4"
m7.save!
ChatRoom.create(movie_id: m7.id)

title = "Django Unchained"
movie = get_movie(title)
m8 = Movie.new(movie)
m8.trailer_url = "https://www.youtube.com/embed/eUdM9vrCbow"
m8.save!
ChatRoom.create(movie_id: m8.id)

title = "Gran Torino"
movie = get_movie(title)
m9 = Movie.new(movie)
m9.trailer_url = "https://www.youtube.com/embed/4s9a5_VqbhY"
m9.save!
ChatRoom.create(movie_id: m9.id)

title = "The Dark Knight"
movie = get_movie(title)
m10 = Movie.new(movie)
m10.trailer_url = "https://www.youtube.com/embed/EXeTwQWrcwY"
m10.save!
ChatRoom.create(movie_id: m10.id)

title = "The Matrix"
movie = get_movie(title)
m11 = Movie.new(movie)
m11.trailer_url = "https://www.youtube.com/embed/m8e-FF8MsqU"
m11.save!
ChatRoom.create(movie_id: m11.id)

title = "The Matrix Reloaded"
movie = get_movie(title)
m12 = Movie.new(movie)
m12.trailer_url = "https://www.youtube.com/embed/2eLXZQXzsXc"
m12.save!
ChatRoom.create(movie_id: m12.id)

title = "The Matrix Revolutions"
movie = get_movie(title)
m13 = Movie.new(movie)
m13.trailer_url = "https://www.youtube.com/embed/3gB8iXl4zHg"
m13.save!
ChatRoom.create(movie_id: m13.id)

title = "The Lord of the Rings: The Two Towers"
movie = get_movie(title)
m14 = Movie.new(movie)
m14.trailer_url = "https://www.youtube.com/embed/LbfMDwc4azU"
m14.save!
ChatRoom.create(movie_id: m14.id)

title = "The Lord of the Rings: The Return of the King"
movie = get_movie(title)
m15 = Movie.new(movie)
m15.trailer_url = "https://www.youtube.com/embed/r5X-hFf6Bwo"
m15.save!
ChatRoom.create(movie_id: m15.id)

title = "The Dark Knight Rises"
movie = get_movie(title)
m16 = Movie.new(movie)
m16.trailer_url = "https://www.youtube.com/embed/g8evyE9TuYk"
m16.save!
ChatRoom.create(movie_id: m16.id)

title = "Inception"
movie = get_movie(title)
m17 = Movie.new(movie)
m17.trailer_url = "https://www.youtube.com/embed/8hP9D6kZseM"
m17.save!
ChatRoom.create(movie_id: m17.id)

title = "Interstellar"
movie = get_movie(title)
m18 = Movie.new(movie)
m18.trailer_url = "https://www.youtube.com/embed/zSWdZVtXT7E"
m18.save!
ChatRoom.create(movie_id: m18.id)

title = "The Prestige"
movie = get_movie(title)
m19 = Movie.new(movie)
m19.trailer_url = "https://www.youtube.com/embed/ijXruSzfGEc"
m19.save!
ChatRoom.create(movie_id: m19.id)

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
