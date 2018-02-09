class CreateSubtasks < ActiveRecord::Migration
  def change
    create_table :subtasks do |t|
      t.string :task_name
      t.string :status
      t.boolean :is_deleted
      t.string :developer_id
      t.references :task, index: true, foreign_key: false

      t.timestamps null: false
    end
  end
end
