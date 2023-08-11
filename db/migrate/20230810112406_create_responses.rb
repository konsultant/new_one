class CreateResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :responses do |t|
      t.integer :price
      t.text :text

      t.timestamps
    end
  end
end
