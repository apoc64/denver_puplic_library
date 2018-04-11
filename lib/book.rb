class Book
  attr_reader :author_first_name,
              :author_last_name,
              :title

def initialize(attributes)
  @author_first_name = attributes[:author_first_name]
  @author_last_name = attributes[:author_last_name]
  @title = attributes[:title]
end

end
