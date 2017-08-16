class RemoveAdressFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_reference :users, :adress, foreign_key: true
  end
end
