class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships, id: false do |t|
      t.references :user, index: true, null: false
      t.references :friend, index: true, null: false
      t.string :relationship, size: 32, null: false
      t.string :status, size: 32, null: false
      t.timestamps
    end
    add_index :friendships, [:user_id, :friend_id], unique: true
    add_index :friendships, :relationship
    add_index :friendships, :status
    add_foreign_key :friendships, :users
    add_foreign_key :friendships, :friends, class_name: 'User'
  end
end
