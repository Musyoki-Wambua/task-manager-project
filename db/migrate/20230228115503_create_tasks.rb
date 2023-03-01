class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string  :title, null: false
      t.string :description, null: false 
      t.datetime :due 
      t.datetime :createdAt, null: false
      t.integer :status, null: false, default: 0
    
      t.timestamps
    end
    
  end
end
