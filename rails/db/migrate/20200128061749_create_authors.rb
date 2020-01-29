class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.references :twitter_user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
