require "test_helper"

class MoviesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movie = movies(:one)
  end

  test "should get index" do
    get movies_url
    assert_response :success
  end

  test "should get new" do
    get new_movie_url
    assert_response :success
  end

  test "should create movie" do
    assert_difference("Movie.count") do
      post movies_url, params: { movie: { actors: @movie.actors, creator: @movie.creator, date: @movie.date, director: @movie.director, download_link: @movie.download_link, genre: @movie.genre, language: @movie.language, rating: @movie.rating, resolution: @movie.resolution, short_description: @movie.short_description, short_title: @movie.short_title, story: @movie.story, thumbnail: @movie.thumbnail, time: @movie.time, title: @movie.title, trailer_link: @movie.trailer_link } }
    end

    assert_redirected_to movie_url(Movie.last)
  end

  test "should show movie" do
    get movie_url(@movie)
    assert_response :success
  end

  test "should get edit" do
    get edit_movie_url(@movie)
    assert_response :success
  end

  test "should update movie" do
    patch movie_url(@movie), params: { movie: { actors: @movie.actors, creator: @movie.creator, date: @movie.date, director: @movie.director, download_link: @movie.download_link, genre: @movie.genre, language: @movie.language, rating: @movie.rating, resolution: @movie.resolution, short_description: @movie.short_description, short_title: @movie.short_title, story: @movie.story, thumbnail: @movie.thumbnail, time: @movie.time, title: @movie.title, trailer_link: @movie.trailer_link } }
    assert_redirected_to movie_url(@movie)
  end

  test "should destroy movie" do
    assert_difference("Movie.count", -1) do
      delete movie_url(@movie)
    end

    assert_redirected_to movies_url
  end
end
