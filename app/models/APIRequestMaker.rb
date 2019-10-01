require 'unirest'

class APIRequestMaker
  def initialize(type, query)
    @type = type #has to be intitle, inauthor or subject
    @query = query
    @api_key = "AIzaSyB8DIVXeJUL4naMfb9c4OOeA53rDXpwIiM" #Is this even secure?
  end

  def build_book_hash
    books = []
    api_results.each do |book_data|
      books << create_book_item(book_data)
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
    book["image_url"] = book_data["volumeInfo"]["imageLinks"]["thumbnail"]
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
    
  def api_results
    Unirest.get("https://www.googleapis.com/books/v1/volumes?q=#{@type}:#{@query}&key=#{@api_key}").body["items"]
  end

end

search = APIRequestMaker.new("intitle", "Jojo")
puts search.api_results