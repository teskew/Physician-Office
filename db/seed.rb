
c1 = Category.create(name:'Cardiology')
p1 = Physician.create(name: 'Dr Bob', email: 'Bob@bob.com', category_id: c1.id)
u1= User.create(name: "Jone", email: "jone@jone.com", password: "jone")

a1 = Appointment.create(appointment_datetime: DateTime.new(2016, 03, 15, 18, 00, 0), user: u1, physician: p1)
# user1 = User.create!(name: "sam", email: "sam@sam.com", password: "1234")

# cat1 = Category.create!(name: "Cardiology" )
# # # cat2 = Category.create(name: "Optomerist" )
# # # cat3=  Category.create(name: "Dentist" )

# phy1 = Physician.create!( name: "Dr Virginia", email: "viriginia@virginia.com ", category_id: cat1.id)
# # phy2 = Physician.create( name: "Dr Edward", email: "edward@edward.com ", category: cat2 )
# # phy3 = Physician.create( name: "Dr Alexander", email: "alexander@alexander.com ", category: cat3 )



# app1 = Appointment.create!(appointement_date: 2021-01-01, user: user1, physican_id: phy1.id)
# # app2 = Appointment.create(appointement_date: "2021-02-02", user: user1, physican: phy2)
# app3 = Appointment.create(appointement_date: "2021-03-03", user: user1, physican: phy3)