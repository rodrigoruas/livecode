require_relative "../scraper"

# write how many tests I want for the fetch_movie_urls method.
describe "#fetch_movie_urls" do

  # name the test (when you rake it's going to be red or green)
  it "returns an array of movies" do

    # create a variable to store all the urls returned from the method

    urls = fetch_movie_urls

    # create a variable with all my expected results

    expected_results = [
      "https://www.imdb.com/title/tt0111161/",
      "https://www.imdb.com/title/tt0068646/",
      "https://www.imdb.com/title/tt0071562/",
      "https://www.imdb.com/title/tt0468569/",
      "https://www.imdb.com/title/tt0050083/"
    ]

    # compare expected results with fetch_movie_urls result
    # if it's the same -> test is ok! -> green
    # if it's not the same -> test is not ok -> red

    expect(urls).to eq(expected_results)
  end
end

#write tests for scrape_movie(url) method

describe "#scrape_movie" do

  it "returns all informations from a specific movie" do

    #create a variable to store the method's result
    movie = scrape_movie("https://www.imdb.com/title/tt0468569/")

    # create a variable with all my expected results
    expected_result = {
      cast: ["Christian Bale", "Heath Ledger", "Aaron Eckhart"],
      director: "Christopher Nolan",
      storyline: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
      title: "The Dark Knight",
      year: "2008"
    }

    #compare expected results with fetch_movie_urls result
    expect(movie).to eq(expected_result)

  end
end
