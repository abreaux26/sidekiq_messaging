class Staff < ApplicationRecord
  has_many :messages,
    foreign_key: :fld_staff_id,
    inverse_of: :recipient

  has_many :sent_messages,
    class_name: "Staff::Message",
    foreign_key: :fld_from_id,
    inverse_of: :sender
end
