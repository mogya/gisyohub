class CreateJobLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :job_logs do |t|
      t.string :job_type, null: false
      t.text :variable_json
      t.datetime :started_at, null: false
      t.datetime :finished_at
      t.text :log

      t.timestamps
    end
    add_index :job_logs, :job_type
    add_index :job_logs, :started_at
    add_index :job_logs, :finished_at
  end
end
