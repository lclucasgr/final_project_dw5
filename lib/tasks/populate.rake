namespace :db do
	task populate: :environment do

		Book.destroy_all

		paths = Dir.glob(Rails.root + 'lib/tasks/populate/images/*')
		100.times do
			Book.create! title: Faker::Book.title,
						 year: Faker::Date.between_except(118.year.ago, Date.today, Date.today).year,
						 author: Faker::Book.author, genre: Faker::Book.genre,
						 number_page: (100..200).to_a.sample,
						 disponivel: true,
						 picture: File.open(paths.sample)  
		end
	end
end