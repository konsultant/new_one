class CreateVacancies < ActiveRecord::Migration[6.1]
  def change
    create_table :vacancies do |t|
      t.string :short_name
      t.text :body
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
