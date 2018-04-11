class Library
  attr_reader :books

  def initialize
    @books = []
  end

  def add_to_collection(book)
    @books << book
  end

  def include?(book_title)
    @books.each do |book|
      return true if book.title == book_title
    end
    false
  end

end
