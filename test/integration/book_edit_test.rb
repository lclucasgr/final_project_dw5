require 'test_helper'

class BookEditTest < ActionDispatch::IntegrationTest

  def setup
    @book = books(:alice)
  end

  test "unsuccessful edit" do
    
    get edit_book_path(@book)
    assert_template 'books/edit'
    patch book_path(@book), params: { book: { title:  "  ",
                                              author: "  ",
                                              year: "20914",
                                              genre: "  ",
                                              number_page: "10000"
                                             } }
 
    assert_template 'books/edit'
  end

  test "successful edit" do
    get edit_book_path(@book)
    assert_template 'books/edit'
    title = "3 porquinhos"
    author = "Valdemar"
    year = "2019"
    genre = "Ficcao"
    number_page = "25"
    patch admin_path(@admin), params: { book: { title: title ,
                                              author: author,
                                              year: year,
                                              genre: genre,
                                              number_page: number_page
                                               } }
    assert_not flash.empty?
    assert_redirected_to '/admin/librarier/index'
    @admin.reload
    assert_equal title, @book.title
    assert_equal author, @book.author 
    assert_equal year,  @book.year
    assert_equal genre, @book.genre 
    assert_equal number_page, @book.number_page
  end

end  