class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :teacher, index: true, null: false
      t.references :student, index: true, null: false
      t.references :homework, index: true, null: false
      t.integer :score, limit: 8, null: false
      t.string :status, size: 32, null: false
      t.timestamps
    end
    add_index :assignments, :status
    add_foreign_key :assignments, :teachers, class_name: 'User'
    add_foreign_key :assignments, :students, class_name: 'User'
    add_foreign_key :assignments, :homeworks
  end
end
