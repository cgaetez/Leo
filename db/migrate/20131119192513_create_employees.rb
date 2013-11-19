class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees, id: false do |t|
      t.references :user, index: true, null: false
      t.references :school, index: true, null: false
      t.string :relationship, size: 32, null: false
      t.string :status, size: 32, null: false
      t.timestamps
    end
    add_index :employees, [:user_id, :school_id], unique: true
    add_index :employees, :relationship
    add_index :employees, :status
    add_foreign_key :employees, :users
    add_foreign_key :employees, :schools
  end
end
