class CreateDevolutions < ActiveRecord::Migration[5.1]
  def change
    create_table :devolutions do |t|
      t.integer :book_id

      t.timestamps
    end
  end
end
