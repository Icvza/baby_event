class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.integer :baby_id
      t.integer :user_id
      t.text :content
      t.datetime :time
      t.timestamps null: false
    end
  end
end
