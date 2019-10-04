require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end


  test "should get new" do
    # get new_book_url
    # assert_response :success
  end

  test "should add book to database" do
    # assert_difference('Book.count') do
    #   post books_url, params: { book: {  } }
    end

    # assert_redirected_to book_url(Book.last)
  end

  test "should show book" do
    # get book_url(@book)
    # assert_response :success
  end

    assert_redirected_to books_url
  end
end
