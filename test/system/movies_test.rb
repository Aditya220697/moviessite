require "application_system_test_case"

class MoviesTest < ApplicationSystemTestCase
  setup do
    @movie = movies(:one)
  end

  test "visiting the index" do
    visit movies_url
    assert_selector "h1", text: "Movies"
  end

  test "should create movie" do
    visit movies_url
    click_on "New movie"

    fill_in "Actors", with: @movie.actors
    fill_in "Creator", with: @movie.creator
    fill_in "Date", with: @movie.date
    fill_in "Director", with: @movie.director
    fill_in "Download link", with: @movie.download_link
    fill_in "Genre", with: @movie.genre
    fill_in "Language", with: @movie.language
    fill_in "Rating", with: @movie.rating
    fill_in "Resolution", with: @movie.resolution
    fill_in "Short description", with: @movie.short_description
    fill_in "Short title", with: @movie.short_title
    fill_in "Story", with: @movie.story
    fill_in "Thumbnail", with: @movie.thumbnail
    fill_in "Time", with: @movie.time
    fill_in "Title", with: @movie.title
    fill_in "Trailer link", with: @movie.trailer_link
    click_on "Create Movie"

    assert_text "Movie was successfully created"
    click_on "Back"
  end

  test "should update Movie" do
    visit movie_url(@movie)
    click_on "Edit this movie", match: :first

    fill_in "Actors", with: @movie.actors
    fill_in "Creator", with: @movie.creator
    fill_in "Date", with: @movie.date
    fill_in "Director", with: @movie.director
    fill_in "Download link", with: @movie.download_link
    fill_in "Genre", with: @movie.genre
    fill_in "Language", with: @movie.language
    fill_in "Rating", with: @movie.rating
    fill_in "Resolution", with: @movie.resolution
    fill_in "Short description", with: @movie.short_description
    fill_in "Short title", with: @movie.short_title
    fill_in "Story", with: @movie.story
    fill_in "Thumbnail", with: @movie.thumbnail
    fill_in "Time", with: @movie.time
    fill_in "Title", with: @movie.title
    fill_in "Trailer link", with: @movie.trailer_link
    click_on "Update Movie"

    assert_text "Movie was successfully updated"
    click_on "Back"
  end

  test "should destroy Movie" do
    visit movie_url(@movie)
    click_on "Destroy this movie", match: :first

    assert_text "Movie was successfully destroyed"
  end
end
