class CreateStaffMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :staff_messages do |t|
      t.string :recipient_id
      t.date :seen_on
      t.text :body
      t.string :sender_id
      t.integer :parent_id
      t.integer :thread_parent_id

      t.timestamps
    end
  end
end
