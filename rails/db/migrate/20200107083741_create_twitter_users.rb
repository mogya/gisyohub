class CreateTwitterUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :twitter_users do |t|
      t.bigint :twitter_user_id
      t.string :name
      t.string :screen_name
      t.string :location
      t.text :description
      t.string :url
      t.text :profile_image_url
      t.text :row

      t.timestamps
    end
    add_index :twitter_users, :twitter_user_id
    add_index :twitter_users, :name
    add_index :twitter_users, :screen_name
  end
end
