# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



user1 = User.create(name: 'Sam', email: "sam@sam.com", password_digest: "1234")
cat1 = Category.create(name: 'Cardiology')
phy1 = Physician.create( name: 'Dr Virginia', email: 'virgina@viva.com', category: cat1 )
app1= Appointment.create(appointment: ('2021/08/03 8:00'), user: user1, physician: phy1)
#Appointment.create([{:appointment => datetime.new(2021,9,17), user: user1, physician: phy1}])