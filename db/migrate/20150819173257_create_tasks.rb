class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.integer :day
      t.integer :hour
      t.integer :minute
      t.belongs_to :room, index: true
      t.timestamps null: false
    end
  end
end