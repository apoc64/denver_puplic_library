require './test/test_helper'
require_relative '../lib/author'

class AuthorTest < Minitest::Test
  def setup
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  def test_it_exists
    assert_instance_of Author, @charlotte_bronte
  end

  def test_it_starts_with_no_books
    assert_equal [], @charlotte_bronte.books
  end

  def test_it_can_add_books
    b1 = @charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    assert_instance_of Book, b1
    assert_equal [b1], @charlotte_bronte.books


    b2 = @charlotte_bronte.add_book("Villette", "1853")
    assert_equal [b1, b2], @charlotte_bronte.books
    publication_date="1847", @title="Villette">]
  end
end
