require 'test_helper'

class DevolutionTest < ActiveSupport::TestCase
  def setup
    @book = books(:porquinhos)
    # This code is not idiomatically correct.
    @devolution = Devolution.new(book_id: @book.id)
  end

  test "should be valid" do
    assert @devolution.valid?
  end

  test "book id should be present" do
    	@devolution.book_id = nil
    	assert_not @devolution.valid?
  end 
end
