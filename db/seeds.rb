# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

mercol = Agreement.create(agreement_no: 10, name: 'Automóvil Club Colombia', active: true, mail_domain: 'acc.com.co')
mercol = Agreement.create(agreement_no: 11, name: 'Coderia', active: true, mail_domain: 'hotmail.com')

#user1 = User.create(first_name: 'Miguel Angel', last_name: 'Blanco Corredor', document_type: 'CC', document_id: '88167911', is_member: false, agreement_id: mercol.id, password: '12345678', email: 'a@a.com')
#user2 = User.create(first_name: 'Katerin', last_name: 'Florez Forero', document_type: 'CC', document_id: '52152064', is_member: false, agreement_id: mercol.id, password: '12345678', email: 'b@a.com')
#user3 = User.create(first_name: 'Jairo', last_name: 'Varela Grecco', document_type: 'CC', document_id: '8672861', is_member: false, agreement_id: mercol.id, password: '12345678', email: 'c@a.com')

#ride1 = Ride.create(agreement_id: mercol.id, user_id: user1.id, ride_when: '2014-06-20 10:00:00', origin: 'La Esperanza', destination: 'Calle 50', cost: 0, seats: 2, notes: 'Nos vemos en el estacionamiento')
#ride2 = Ride.create(agreement_id: mercol.id, user_id: user2.id, ride_when: '2014-06-21 11:00:00', origin: 'Calle 20', destination: 'Bocayá', cost: 10.5, seats: 4, notes: 'Camioneta negra afuera de la oficina')
#ride3 = Ride.create(agreement_id: mercol.id, user_id: user1.id, ride_when: '2014-06-21 14:00:00', origin: 'Av Carrera', destination: 'Calle 49', cost: 0, seats: 3, notes: 'No se permite fumar')
#ride4 = Ride.create(agreement_id: mercol.id, user_id: user3.id, ride_when: '2014-06-10 09:00:00', origin: 'Calle 40', destination: 'Av Carrera', cost: 0, seats: 2, notes: 'No hago paradas')
#ride5 = Ride.create(agreement_id: mercol.id, user_id: user3.id, ride_when: '2014-06-24 17:00:00', origin: 'Las Américas', destination: 'Ciudad de Calí', cost: 20, seats: 3, notes: 'Ninguna')

#user1.rides << ride2
#user1.rides << ride5
#user2.rides << ride1
#user2.rides << ride5
#user3.rides << ride1
#user3.rides << ride2
