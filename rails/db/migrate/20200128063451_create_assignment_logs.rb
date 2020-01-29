class CreateAssignmentLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :assignment_logs do |t|
      t.references :author, null: true, foreign_key: true
      t.references :worker, null: false, foreign_key: true
      t.references :tweet, null: true, foreign_key: true
      t.references :book, null: true, foreign_key: true
      t.references :event, null: true, foreign_key: true
      t.integer :actionType
      t.text :log

      t.timestamps
    end
  end
end
