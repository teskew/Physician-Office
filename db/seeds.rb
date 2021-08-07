# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
a = Appointment.create([{appointement_datetime: DateTime.new(2021-09-15)}])
Physician.create([{appointement: appointement_datetime, name: 'Dr Merdith', email: 'Merdith@Northwestern.com'},
{Appointment: a, name: 'Dr Leonard', email: 'Leonard@Northwestern.com'},
{Appointment: a, name: 'Dr Phillip', email: 'Phillip@Northwestern.com'}])

