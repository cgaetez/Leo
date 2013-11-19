class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions, id: false do |t|
      t.references :user, index: true, null: false
      t.references :course, index: true, null: false
      t.string :relationship, size: 32, null: false
      t.string :status, size: 32, null: false
      t.timestamps
    end
    add_index :subscriptions, [:user_id, :course_id], unique: true
    add_index :subscriptions, :relationship
    add_index :subscriptions, :status
  end
end
