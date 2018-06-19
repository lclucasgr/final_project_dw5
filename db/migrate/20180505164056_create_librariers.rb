class CreateLibrariers < ActiveRecord::Migration[5.1]
  def change
    create_table :librariers do |t|
      t.string :name
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
