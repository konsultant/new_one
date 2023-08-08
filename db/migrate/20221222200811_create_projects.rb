class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :short_title
      t.string :title
      t.string :author
      t.integer :projects_budget
      t.string :tags_tecnologies
      t.date :implementation_period
      t.string :currency_budget
      t.string :project_status
      t.integer :author_id

      t.timestamps
    end
  end
end
