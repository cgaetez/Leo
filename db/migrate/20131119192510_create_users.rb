class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :document_id, size: 32, null: false
      t.string :first_name, size: 128, null: false
      t.string :last_name, size: 128, null: false
      t.date :date_of_birth
      t.string :picture, size: 128, null: false
      t.string :background, size: 128, null: false
      t.string :status, size: 32, null: false
      t.timestamps
    end
    add_index :users, :document_id, unique: true
    add_index :users, [:first_name, :last_name]
    add_index :users, :status
  end
end
