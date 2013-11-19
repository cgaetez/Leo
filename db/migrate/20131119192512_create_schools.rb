class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name, size: 128, null: false
      t.text :address
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.string :url, size: 255, null: false
      t.string :picture, size: 128, null: true
      t.string :status, size: 32, null: false
      t.timestamps
    end
    add_index :schools, :name, unique: true
    add_index :schools, :url
    add_index :schools, :picture
    add_index :schools, :status
  end
end
