class CreateUserTablesAndAddUserIdToPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.timestamps
    end
    
    add_reference :posts, :user, foreign_key: true
  end
end
