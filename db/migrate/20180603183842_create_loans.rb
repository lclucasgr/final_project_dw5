class CreateLoans < ActiveRecord::Migration[5.1]
  def change
    create_table :loans do |t|
      t.integer :student_id
      t.integer :book_id
      t.date :data

      t.timestamps
    end
  end
end
