class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :developer_id
      t.string :user_name

      t.timestamps null: false
    end
  end
end
