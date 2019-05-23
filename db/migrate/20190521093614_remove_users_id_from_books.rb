class RemoveUsersIdFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :users_id, :integer
  end
end
