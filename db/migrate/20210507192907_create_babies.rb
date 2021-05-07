class CreateBabies < ActiveRecord::Migration[6.1]
  def change
    create_table :babies do |t|
      t.integer :user_id
      t.string :name
      t.string :DOB
    end
  end
end
