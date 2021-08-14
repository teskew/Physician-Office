u1= User.create(username: "Jone", email: "jone@jone.com", password: "jone")
c1 = Category.create(name:'Cardiology')
p1 = Physician.create(name: 'Dr Bob', email: 'Bob@bob.com', user: u1)
#a1=  Appointment.create(appointment_datetime: DateTime.new(2016, 03, 15, 18, 00, 0), category: c1, physician: p1)

 a1=  Appointment.create(date: Date.parse("Dec 8 2015"), category: c1, physician: p1)
 # user1 = User.create!(name: "sam", email: "sam@sam.com", password: "1234")

# cat1 = Category.create!(name: "Cardiology" )
# # # cat2 = Category.create(name: "Optomerist" )
