class StaffMessage < ApplicationRecord
  belongs_to :recipient,
      foreign_key: :recipient_id,
      class_name: "Staff"

  belongs_to :sender,
    foreign_key: :sender_id,
    class_name: "Staff"

  belongs_to :parent,
    foreign_key: :parent_id,
    class_name: "StaffMessage",
    optional: true

  has_one :response,
    foreign_key: :parent_id,
    class_name: "StaffMessage"

  belongs_to :thread,
    foreign_key: :thread_id,
    class_name: "StaffMessage",
    optional: true

  scope :unread, -> { where(seen_on: nil) }
  scope :read, -> { where.not(seen_on: nil) }
  scope :start_of_thread, -> { where(parent: nil)}

  def read?
    seen_on.present? && seen_on <= Date.current
  end

  def unread?
    !read?
  end

  def mark_as_read!
    update!(seen_on: Date.current) unless read?
  end

  def mark_as_unread!
    update!(seen_on: nil)
  end
end
