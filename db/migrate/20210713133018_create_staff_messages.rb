class CreateStaffMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :staff_messages do |t|
      t.string :staff_id
      t.date :date_seen
      t.text :message
      t.string :from_id
      t.integer :reply_key
      t.integer :thread_parent_id

      t.timestamps
    end
  end
end
