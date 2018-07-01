require 'test_helper'

class LoanTest < ActiveSupport::TestCase
  
  def setup
    @student = students(:pablo)
    @book = books(:porquinhos)
    # This code is not idiomatically correct.
    @loan = Loan.new(book_id: @book.id, student_id: @student.id)
  end

  test "should be valid" do
    assert @loan.valid?
  end

  test "student id should be present" do
    @loan.student_id = nil
    assert_not @loan.valid?
  end

  test "book id should be present" do
    @loan.book_id = nil
    assert_not @loan.valid?
  end

  #duvida
  test "associated loans students should be destroyed" do
    @student.save
    @student.loans.create!(book_id: @book.id, student_id: @student.id)
    assert_difference 'Loan.count', -1 do
      @student.destroy
    end
  end

   test "associated loans books should be destroyed" do
    @book.save
    @book.loans.create!(book_id: @book.id, student_id: @student.id)
    assert_difference 'Book.count', -1 do
      @book.destroy
    end
  end


end
