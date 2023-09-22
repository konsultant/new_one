class AddStateToResponses < ActiveRecord::Migration[6.1]
  def change
    add_column :responses, :state, :boolean
  end
end
