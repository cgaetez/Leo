class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.references :teacher, index: true, null: false
      t.references :course, index: true, null: false
      t.string :activity, size: 32, null: false
      t.string :title, size: 128, null: false
      t.text :content
      t.string :status, size: 32, null: false
      t.timestamps
    end
    add_index :homeworks, :activity
    add_index :homeworks, :title
    add_index :homeworks, :status
    add_foreign_key :homeworks, :teachers, class_name: 'User'
    add_foreign_key :homeworks, :courses
  end
end
