require "open-uri"
require "nokogiri"

url = "https://www.empireonline.com/movies/news/"

html_file = URI.open(url).read
html_doc = Nokogiri::HTML(html_file)

# link and title
# html_doc.search("a.jsx-2519753491.title").each do |element|
#   puts element.text.strip
#   puts element.attribute("href").value
# end

# description

# html_doc.search("a.description").each do |element|
#   puts element.text.strip
# end

# img_url

html_doc.search("img.jsx-952983560.loading").each do |element|
  # puts element.text.strip
  puts element.attribute("data-src").value
end
