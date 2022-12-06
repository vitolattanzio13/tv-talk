require "json"
require "open-uri"
require "nokogiri"

Notification.destroy_all
PostVote.destroy_all
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
puts "Creating users..."
fran = User.new(email: "fran@gmail.com", password: "123456", nickname: "fran", bio: "A brief note about myself first: apart from being a film geek, I'm also a huge nature freak and amateur photographer"
file = URI.open("https://avatars.githubusercontent.com/u/104527931?v=4")
fran.photo.attach(io: file, filename: "fran.jpg", content_type: "image/jpg")
fran.save!
Notification.create!(user_id: fran.id)

puts "Fran created"

vito = User.new(email: "vito@gmail.com", password: "123456", nickname: "vito")
file = URI.open("https://avatars.githubusercontent.com/u/62178588?v=4")
vito.photo.attach(io: file, filename: "vito.jpg", content_type: "image/jpg")
vito.save!
Notification.create!(user_id: vito.id)
puts "Vito created"

jorrit = User.new(email: "jorrit@gmail.com", password: "123456", nickname: "jorrit")
file = URI.open("https://avatars.githubusercontent.com/u/101260772?v=4")
jorrit.photo.attach(io: file, filename: "jorrit.jpg", content_type: "image/jpg")
jorrit.save!
Notification.create!(user_id: jorrit.id)
puts "Jorrit created"

leo = User.new(email: "leo@gmail.com", password: "123456", nickname: "leo")
file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1666021133/yxhif62kivyl2678wt3z.jpg")
leo.photo.attach(io: file, filename: "leo.jpg", content_type: "image/jpg")
leo.save!
Notification.create!(user_id: leo.id)
puts "Leo created"

arthur = User.new(email: "arthur@gmail.com", password: "123456", nickname: "arthur")
file = URI.open("https://avatars.githubusercontent.com/u/115401398?v=4")
arthur.photo.attach(io: file, filename: "arthur.jpg", content_type: "image/jpg")
arthur.save!
Notification.create!(user_id: arthur.id)
puts "Arthur created"

maria = User.new(email: "maria@gmail.com", password: "123456", nickname: "maria")
file = URI.open("https://avatars.githubusercontent.com/u/115433579?v=4")
maria.photo.attach(io: file, filename: "maria.jpg", content_type: "image/jpg")
maria.save!
Notification.create!(user_id: maria.id)
puts "Maria created"

laura = User.new(email: "laura@gmail.com", password: "123456", nickname: "laura")
file = URI.open("https://avatars.githubusercontent.com/u/107079059?v=4")
laura.photo.attach(io: file, filename: "laura.jpg", content_type: "image/jpg")
laura.save!
Notification.create!(user_id: laura.id)
puts "Laura created"

ganzo = User.new(email: "ganzo@gmail.com", password: "123456", nickname: "ganzo")
file = URI.open("https://avatars.githubusercontent.com/u/90385363?v=4")
ganzo.photo.attach(io: file, filename: "ganzo.jpg", content_type: "image/jpg")
ganzo.save!
Notification.create!(user_id: ganzo.id)
puts "Ganzo created"
puts "Users created!"

# Create movies

puts "Creating movies..."

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
c4 = ChatRoom.create(movie_id: m4.id)

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

puts "Movies created!"

# Create posts

puts "Creating posts..."

p2 = Post.new(content: "I want Mia's foot massages lol", chat_room_id: c4.id, user_id: ganzo.id, likes: 17)
p2.save
p3 = Post.new(content: "I love this movie", chat_room_id: c4.id, user_id: maria.id, likes: 2)
p3.save
p4 = Post.new(content: "Team Marcellus or team Butch???", chat_room_id: c4.id, user_id: jorrit.id, likes: 1)
p4.save
p1 = Post.new(content: "Best movie ever", chat_room_id: c4.id, user_id: fran.id, likes: 4)
p1.save

p5 = Post.new(content: "This movie is to old for me", chat_room_id: c2.id, user_id: leo.id, likes: 10)
p5.save
p6 = Post.new(content: "Best time traveling trilogy in th world!", chat_room_id: c2.id, user_id: ganzo.id, likes: 0)
p6.save
p7 = Post.new(content: "I hate Marty McFly", chat_room_id: c2.id, user_id: laura.id, likes: 36)
p7.save
p8 = Post.new(content: "Greate movie", chat_room_id: c2.id, user_id: maria.id, likes: 5)
p8.save

p9 = Post.new(content: "Al Pacino is the best", chat_room_id: c3.id, user_id: vito.id, likes: 3)
p9.save
p10 = Post.new(content: "Darth Vader is the best", chat_room_id: c1.id, user_id: jorrit.id, likes: 0)
p10.save
p11 = Post.new(content: "Love it!!", chat_room_id: c1.id, user_id: arthur.id, likes: 1)
p11.save

# Create notifications for reply



# Pulp fiction replies

puts "Creating replies..."
r1 = Reply.new(content: "I also love it",post_id: p1.id, user_id: jorrit.id, read: true)
r1.save
r3 = Reply.new(content: "Ha ha your're so funny",post_id: p2.id, user_id: maria.id, read: true)
r3.save
r4 = Reply.new(content: "Thank you",post_id: p2.id, user_id: ganzo.id, read: true)
r4.save

puts "Posts created!"

# News articles

puts "Scraping news articles..."

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

puts "News articles created!"
