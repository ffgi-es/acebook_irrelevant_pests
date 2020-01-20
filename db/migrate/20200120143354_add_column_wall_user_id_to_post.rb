class AddColumnWallUserIdToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :wall_user_id, :bigint
  end
end
