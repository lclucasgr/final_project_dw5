class AddDisponivelToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :disponivel, :boolean, default: true
  end
end
