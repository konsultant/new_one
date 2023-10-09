class AddCharacterToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :character, :string
  end
end
