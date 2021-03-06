class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :location_name
      t.integer :level_id
      t.integer :bookmark_id
      t.string :password_digest

      t.timestamps
    end
  end
end
