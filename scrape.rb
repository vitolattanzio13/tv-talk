require "open-uri"
require "nokogiri"

url = "https://www.empireonline.com/movies/news/"

html_file = URI.open(url).read
html_doc = Nokogiri::HTML(html_file)

# link and title
links = []
html_doc.search("a.jsx-2519753491.title").each do |element|
  #title
  puts element.text.strip
  #link
  links << element.attribute("href").value
end



# html_doc.search("a.description").each do |element|
# description
#   puts element.text.strip
# end

# imgs = []
# html_doc.search("img.jsx-952983560.loading").each do |element|
#   # img_url
#   imgs << element.attribute("data-src").value
# end
