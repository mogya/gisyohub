class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :keyword

      t.timestamps
    end
    create_table :event_authors do |t|
      t.references :author, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.string :space_name

      t.timestamps
    end
    create_table :event_books do |t|
      t.references :book, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
