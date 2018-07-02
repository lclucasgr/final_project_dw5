require 'test_helper'

class StudentEditTest < ActionDispatch::IntegrationTest

  def setup
    @student = students(:pablo)
  end

  test "unsuccessful edit" do
    
    get edit_student_path(@student)
    assert_template 'student/edit'
    patch book_path(@book), params: { student: { name:  "  ",
                                              email: "foo@invalid",
                                              turma: "20B",
                                              celular: "8502-9714",
                                             } }
 
    assert_template 'students/edit'
  end

  test "successful edit" do
    get edit_student_path(@student)
    assert_template 'students/edit'
    name = "Joseph"
    email = "joseph@gmail.com"
    turma = "2B"
    celular = "8514-9702"
    patch student_path(@student), params: { student: { name: name ,
                                              email: email,
                                              turma: turma,
                                              celular: celular,
                                               } }
    assert_not flash.empty?
    assert_redirected_to '/librarier/student/index'
    @student.reload
    assert_equal name, @student.name
    assert_equal email, @student.email 
    assert_equal turma,  @student.turma
    assert_equal celular, @student.celular 
  end

end  