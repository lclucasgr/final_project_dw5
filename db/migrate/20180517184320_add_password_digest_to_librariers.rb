class AddPasswordDigestToLibrariers < ActiveRecord::Migration[5.1]
  def change
    add_column :librariers, :password_digest, :string
  end
end
