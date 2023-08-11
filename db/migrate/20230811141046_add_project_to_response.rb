class AddProjectToResponse < ActiveRecord::Migration[6.1]
  def change
    add_reference :responses, :project, null: false, foreign_key: true
  end
end
