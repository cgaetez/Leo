class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references :homework, index: true
      t.string :title, size: 128, null: false
      t.text :content
      t.string :status, size: 32, null: false
      t.timestamps
    end
    add_index :pages, :status
    add_foreign_key :pages, :homeworks
  end
end
