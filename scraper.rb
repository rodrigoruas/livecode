
require "open-uri"
require "nokogiri"

# function to return the urls of the top 5 movies from IMDB
def fetch_movie_urls

  results = []
  #1 open the webpage and get its html -> html string
  html_string = open("https://www.imdb.com/chart/top").read

  #2 transform html string into a Nokogiki Object
  doc = Nokogiri::HTML(html_string)

  #3 search the nokogiri object for the links I am looking for
  movies = doc.search(".titleColumn a").first(5)

  movies.each do |movie|
  # store them into an array
    results << "https://www.imdb.com#{movie.attributes["href"].value}"
  end

  #4 return the array
  return results

end


# function that scrapes an imdb url and returns a hash with all the information
def scrape_movie(url)

  #1 open the webpage and get its html -> string
  html_string = open(url, "Accept-Language" => "en").read

  #2 transform the html string into a Nokogiri Object
  doc = Nokogiri::HTML(html_string)

  #3 search the nokogiri object for the informations I am looking for
  #and store them into a hash

  title = doc.search(".title_wrapper h1").text.split("(").first.chop
  year =  doc.search(".title_wrapper h1").text.split("(").last.strip.chop
  storyline = doc.search(".summary_text").text.strip
  director = doc.search(".credit_summary_item").first.text.split("Director:").last.strip

  cast = []
  actors = doc.search(".primary_photo").first(3)

  actors.each do |actor|
    cast << actor.next_element.text.strip
  end

  #4 return the hash

  {
    title: title,
    storyline: storyline,
    director: director,
    year: year,
    cast: cast
  }
end


movies_urls = fetch_movie_urls

movies_urls.each do |url|
  p scrape_movie(url)
end















