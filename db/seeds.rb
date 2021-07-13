# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ben = Staff.create!(staff_id: "BW-00", name: "Ben Watson")
angel = Staff.create!(staff_id: "AB-00", name: "Angel Breaux")
jenny = Staff.create!(staff_id: "JB-00", name: "Jenny Branham")

jenny_to_ben = StaffMessage.create!(recipient: ben, body: "message", sender: jenny)
ben_to_jenny = StaffMessage.create!(recipient: jenny, body: "reply to message 1", sender: ben, parent: jenny_to_ben)
jenny_to_ben_2 = StaffMessage.create!(recipient: ben, body: "another reply", sender: jenny, parent: ben_to_jenny)

angel_to_jenny = StaffMessage.create!(recipient: jenny, body: "message", sender: angel)
jenny_to_angel = StaffMessage.create!(recipient: angel, body: "reply to message 1", sender: jenny, parent: angel_to_jenny)
angel_to_jenny_2 = StaffMessage.create!(recipient: jenny, body: "another reply", sender: angel, parent: jenny_to_angel)


angel_to_ben = StaffMessage.create!(recipient: ben, body: "message", sender: angel)
ben_to_angel = StaffMessage.create!(recipient: angel, body: "reply to message 1", sender: ben, parent: angel_to_ben, thread: angel_to_ben)
