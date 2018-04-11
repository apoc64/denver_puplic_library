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

end
