class AddResponseToProject < ActiveRecord::Migration[6.1]
  def change
    add_reference :projects, :response, foreign_key: true
  end
end
