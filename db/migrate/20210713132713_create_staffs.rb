class CreateStaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :staffs do |t|
      t.string :staff_id
      t.string :name

      t.timestamps
    end
  end
end
