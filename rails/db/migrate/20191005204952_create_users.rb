class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :user_name, null: false
      t.string :image_url
      t.string :email
      t.string :access_token, null: false
      t.string :access_secret, null: false
      t.text :raw_auth

      t.timestamps
    end
    add_index :users, :provider
    add_index :users, :uid
  end
end
