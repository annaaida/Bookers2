class AddUsersIdToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :users_id, :integer
  end
end
