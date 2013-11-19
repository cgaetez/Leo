class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :student, index: true, null: false
      t.references :homework, index: true, null: false
      t.references :page, index: true, null: false
      t.integer :start_at_character, null: false, default: 0
      t.integer :ends_at_character, null: false, default: 0
      t.text :content
      t.string :status, size: 32, null: false
      t.timestamps
    end
    add_index :comments, [:start_at_character, :ends_at_character]
    add_index :comments, :status
    add_foreign_key :comments, :students, class_name: 'User'
    add_foreign_key :comments, :homeworks
    add_foreign_key :comments, :pages
  end
end
