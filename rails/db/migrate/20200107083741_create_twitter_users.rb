class CreateTwitterUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :twitter_users do |t|
      t.bigint :twitter_user_id, null: false
      t.string :name, null: false
      t.string :screen_name, null: false
      t.string :location, null: true
      t.text :description, null: true
      t.string :url, null: true
      t.text :profile_image_url, null: true
      t.text :row, null: false

      t.timestamps
    end
    add_index :twitter_users, :twitter_user_id
    add_index :twitter_users, :name
    add_index :twitter_users, :screen_name
  end
end
