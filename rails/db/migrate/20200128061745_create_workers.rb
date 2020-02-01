class CreateWorkers < ActiveRecord::Migration[6.0]
  def change
    create_table :workers do |t|
      t.references :user, null: true, foreign_key: true
      t.references :twitter_user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
