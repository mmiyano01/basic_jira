class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.string :status
      t.boolean :is_deleted
      t.string :developer_id

      t.timestamps null: false
    end
  end
end
