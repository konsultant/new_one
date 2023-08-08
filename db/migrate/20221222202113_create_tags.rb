class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :title
      t.references :articles, null: false, foreign_key: true

      t.timestamps
    end
  end
end
