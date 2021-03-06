require './test/test_helper'
require './lib/library'
require './lib/author'

class LibraryTest < Minitest::Test

  def setup
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    @jane_eyre = @charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    @villette  = @charlotte_bronte.add_book("Villette", "1853")
    @harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    @mockingbird = @harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    @dpl = Library.new
  end

  def test_it_exists
    assert_instance_of Library, @dpl
  end

  def test_it_starts_with_no_books
    assert_equal [], @dpl.books
  end

  def test_it_can_add_to_collection
    @dpl.add_to_collection(@jane_eyre)
    assert_equal [@jane_eyre], @dpl.books
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@villette)
    assert_equal [@jane_eyre, @mockingbird, @villette], @dpl.books
  end

  def test_it_includes
    @dpl.add_to_collection(@jane_eyre)
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@villette)
    assert @dpl.include?("To Kill a Mockingbird")
    refute @dpl.include?("A Connecticut Yankee in King Arthur's Court")
  end

  def test_it_has_a_card_catalogue_on_alphabetical_order
    @dpl.add_to_collection(@jane_eyre)
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@villette)
    al = Author.new({first_name: "Al", last_name: "Allen"})
    b1 = al.add_book("Some book", "October 16, 1907")
    @dpl.add_to_collection(b1)
    expected = [b1, @jane_eyre, @villette, @mockingbird]
    assert_equal expected, @dpl.card_catalogue
  end

  def test_it_can_find_by_author
    @dpl.add_to_collection(@jane_eyre)
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@villette)
    actual = @dpl.find_by_author("Charlotte Bronte")
    expected = {"Jane Eyre" => @jane_eyre, "Villette" => @villette}
    assert_equal expected, actual
  end

  def test_it_can_find_by_publication_date
    @dpl.add_to_collection(@jane_eyre)
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@villette)
    actual = @dpl.find_by_publication_date("1960")
    expected = {"To Kill a Mockingbird" => @mockingbird}
    assert_equal expected, actual
  end

  def test_it_maps_books_to_hash
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@villette)
    actual = @dpl.map_books_to_hash(@dpl.books)
    expected = {"To Kill a Mockingbird" => @mockingbird, "Villette" => @villette}
    assert_equal expected, actual
  end

end
