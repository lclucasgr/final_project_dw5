require 'test_helper'

class BookTest < ActiveSupport::TestCase
  
   def setup
    @book = Book.new(title: "tres porquinhos", author: "Mario Quintana", genre: "infantil", number_page: "50", year: "2018")
   end

   test "should be valid" do
    assert @book.valid?
   end

   test "title should be present" do
    @book.title = "     "
    assert_not @book.valid?
   end

   test "author should be present" do
    @book.author = "     "
    assert_not @book.valid?
   end

   test "genre should be present" do
    @book.genre = "     "
    assert_not @book.valid?
   end

   test "number page should be present" do
    @book.number_page = "     "
    assert_not @book.valid?
   end

   test "year should be present" do
    @book.year = "     "
    assert_not @book.valid?
   end

   test "title should not be too long" do
    @book.title = "a" * 256
    assert_not @book.valid?
   end

   test "author should not be too long" do
    @book.author = "a" * 101
    assert_not @book.valid?
   end

   test "year should not be too long" do
    @book.year = "a" * 5
    assert_not @book.valid?
   end

   test "year should not be too short" do
    @book.year = "a" * 3
    assert_not @book.valid?
   end


end
