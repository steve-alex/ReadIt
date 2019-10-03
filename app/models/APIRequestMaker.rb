require 'unirest'

class APIRequestMaker
  @@api_key = "AIzaSyB8DIVXeJUL4naMfb9c4OOeA53rDXpwIiM" #Is this even secure?

  attr_accessor :type, :query, :num_results
  
  # def initialize(type:, query:, num_results:)
  #   @type = type #has to be intitle, inauthor or subject
  #   @query = query
  #   @num_results = num_results
  #   @api_key = "AIzaSyB8DIVXeJUL4naMfb9c4OOeA53rDXpwIiM" #Is this even secure?
  # end

  def build_book_hash(api_results)
    books = []
    if api_results
      api_results.each do |book_data|
        books << create_book_item(book_data)
      end
    end
    books
  end
    
  def create_book_item(book_data)
    book = {}
    book["google_id"] = book_data["id"]
    book["title"] = book_data["volumeInfo"]["title"]
    book["subtitle"] = book_data["volumeInfo"]["subtitle"]
    book["authors"] = parse_array(book_data["volumeInfo"]["authors"]) #Make this a string
    book["categories"] = parse_array(book_data["volumeInfo"]["categories"]) #Slice this into different genres
    book["description"] = book_data["volumeInfo"]["description"]
    book["language"] = book_data["volumeInfo"]["language"]
    book["image_url"] = verify_image(book_data)
    book["published_date"] = book_data["volumeInfo"]["publisheddate"]
    book["page_count"] = book_data["volumeInfo"]["pageCount"]
    book["google_average_rating"] = book_data["volumeInfo"]["averageRating"] #Check if this exists
    book["rating_count"] = book_data["volumeInfo"]["ratingsCount"]
    book
  end

  def parse_array(array)
    if array
      array.join(", ")
    else
      nil
    end
  end

  def verify_image(book_data)
    if book_data["volumeInfo"]["imageLinks"]
      return book_data["volumeInfo"]["imageLinks"]["thumbnail"]
    else
      "https://lled.educ.ubc.ca/files/2017/10/460.png"
    end
  end
    
  def api_results(type, query, num_results)
    Unirest.get("https://www.googleapis.com/books/v1/volumes?q=#{type}:#{query}&maxResults=#{num_results}&key=#{@@api_key}").body["items"]
  end

end