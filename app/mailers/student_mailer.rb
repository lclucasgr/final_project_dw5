class StudentMailer < ApplicationMailer

	default from: 'from@example.com'

	def student_email(student)
		@student = student
		mail(to: @student.email, subject: 'Welcome')
	end	
end
