class CreateStaffMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :staff_messages do |t|
      t.references :recipient, foreign_key: {to_table: :staffs}
      t.date :seen_on
      t.text :body
      t.references :sender, foreign_key: {to_table: :staffs}
      t.references :parent, foreign_key: {to_table: :staff_messages}
      t.references :thread_parent, foreign_key: {to_table: :staff_messages}

      t.timestamps
    end
  end
end
