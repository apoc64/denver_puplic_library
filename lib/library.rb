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

  def card_catalogue
    @books.sort_by do |book|
      book.author_last_name
    end
  end

  def find_by_author(author)
    @books.find_all do |book|
      name = book.author_first_name + " " + book.author_last_name
      name == author
    end.map do |book|
      [book.title, book]
    end.to_h
  end

  def find_by_publication_date(date)
    @books.find_all do |book|
      book.publication_date == date
    end.map do |book|
      [book.title, book]
    end.to_h
  end

  def map_books_to_hash(books)
    books.map do |book|
      [book.title, book]
    end.to_h
  end

end
