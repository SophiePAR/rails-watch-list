require "json"
require "open-uri"

Bookmark.destroy_all
Movie.destroy_all

url = 'https://tmdb.lewagon.com/movie/top_rated'
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)

movies["results"].each do |movie|
  movie_selection = Movie.new(
    title: movie["title"],
    overview: movie["overview"],
    poster_url: movie["poster_path"],
    rating: movie["vote_average"].to_i
  )
  movie_selection.save!
end
