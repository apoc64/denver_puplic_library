class Author
  attr_reader :books

  def initialize(attributes)
    @attributes = attributes
    @books = []
  end

  def add_book(title, date)
    book_attributes = @attributes.dup
    book_attributes[:title] = title
    book_attributes[:publication_date] = date
    book = Book.new(book_attributes)
    @books << book
    book
  end

end
