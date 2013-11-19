class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.references :user, index: true
      t.references :school, index: true
      t.string :name, size: 32, null: false
      t.string :level, size: 32, null: false
      t.string :year, size: 32, null: false
      t.string :status, size: 32, null: false
      t.timestamps
    end
    add_index :courses, [:school_id, :name], unique: true
    add_index :courses, [:level, :year]
    add_index :courses, :status
    add_foreign_key :courses, :users
    add_foreign_key :courses, :schools
  end
end
