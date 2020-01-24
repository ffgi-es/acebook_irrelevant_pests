class CascadeDeletionOfLikesOnPostDeletion < ActiveRecord::Migration[5.2]
  def change
    remove_reference :likes, :post
    add_reference :likes, :post, foreign_key: true, on_delete: :cascade
  end
end
