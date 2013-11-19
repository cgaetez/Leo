class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers, id: false do |t|
      t.references :student, index: true, null: false
      t.references :homework, index: true, null: false
      t.references :page, index: true, null: false
      t.text :content
      t.string :status, size: 32, null: false
      t.timestamps
    end
    add_index :answers, :status
    add_foreign_key :answers, :students, class_name: 'User'
    add_foreign_key :answers, :homeworks
    add_foreign_key :answers, :pages
  end
end
