# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env == "production"
	#Agreement.create(agreement_no: 0, name: 'Automóvil Club Colombia', active: true, mail_domain: 'acc.com.co')
	#Agreement.create(agreement_no: 0, name: 'Coderia', active: true, mail_domain: 'coderia.mx')

#else

InsurancePrice.create(vehicle_type: "Motos", size: "Menos de 100 c.c.", age_old: nil, price: 267400)
InsurancePrice.create(vehicle_type: "Motos", size: "De 100 a 200 c.c.", age_old: nil, price: 358450)
InsurancePrice.create(vehicle_type: "Motos", size: "Más de 200 c.c.", age_old: nil, price: 404200)
InsurancePrice.create(vehicle_type: "Motos", size: "Motocarros", age_old: nil, price: 404200)
InsurancePrice.create(vehicle_type: "Camperos y Camionetas", size: "Menos de 1500 c.c.", age_old: "0 a 9 años", price: 429400)
InsurancePrice.create(vehicle_type: "Camperos y Camionetas", size: "Menos de 1500 c.c.", age_old: "más de 10 años", price: 516400)
InsurancePrice.create(vehicle_type: "Camperos y Camionetas", size: "De 1500 a 2500 c.c.", age_old: "0 a 9 años", price: 512800)
InsurancePrice.create(vehicle_type: "Camperos y Camionetas", size: "De 1500 a 2500 c.c.", age_old: "más de 10 años", price: 607600)
InsurancePrice.create(vehicle_type: "Camperos y Camionetas", size: "Más de 2500 c.c.", age_old: "0 a 9 años", price: 601450)
InsurancePrice.create(vehicle_type: "Camperos y Camionetas", size: "Más de 2500 c.c.", age_old: "más de 10 años", price: 690400)
InsurancePrice.create(vehicle_type: "Carga o Mixto", size: "Menos de 5 toneladas", age_old: nil, price: 481300)
InsurancePrice.create(vehicle_type: "Carga o Mixto", size: "De 5 a 15 toneladas", age_old: nil, price: 694900)
InsurancePrice.create(vehicle_type: "Carga o Mixto", size: "Más de 15 toneladas", age_old: nil, price: 878500)
InsurancePrice.create(vehicle_type: "Oficiales Especiales", size: "Menos de 1500 c.c.", age_old: nil, price: 541450)
InsurancePrice.create(vehicle_type: "Oficiales Especiales", size: "De 1500 a 2500 c.c.", age_old: nil, price: 682600)
InsurancePrice.create(vehicle_type: "Oficiales Especiales", size: "Más de 2500 c.c.", age_old: nil, price: 818200)
InsurancePrice.create(vehicle_type: "Autos Familiares", size: "Menos de 1500 c.c.", age_old: "0 a 9 años", price: 242200)
InsurancePrice.create(vehicle_type: "Autos Familiares", size: "Menos de 1500 c.c.", age_old: "Más de 10 años", price: 321100)
InsurancePrice.create(vehicle_type: "Autos Familiares", size: "De 1500 a 2500 c.c.", age_old: "0 a 9 años", price: 295000)
InsurancePrice.create(vehicle_type: "Autos Familiares", size: "De 1500 a 2500 c.c.", age_old: "Más de 10 años", price: 366850)
InsurancePrice.create(vehicle_type: "Autos Familiares", size: "Más de 2500 c.c.", age_old: "0 a 9 años", price: 344650)
InsurancePrice.create(vehicle_type: "Autos Familiares", size: "Más de 2500 c.c.", age_old: "Más de 10 años", price: 408850)
InsurancePrice.create(vehicle_type: "Vehículos para 6 o más pasajeros", size: "Menos de 2500 c.c.", age_old: "0 a 9 años", price: 431950)
InsurancePrice.create(vehicle_type: "Vehículos para 6 o más pasajeros", size: "Menos de 2500 c.c.", age_old: "Más de 10 años", price: 551500)
InsurancePrice.create(vehicle_type: "Vehículos para 6 o más pasajeros", size: "Más de 2500 c.c.", age_old: "0 a 9 años", price: 578200)
InsurancePrice.create(vehicle_type: "Vehículos para 6 o más pasajeros", size: "Más de 2500 c.c.", age_old: "Más de 10 años", price: 694150)
InsurancePrice.create(vehicle_type: "Autos de negocios y Taxis", size: "Menos de 1500 c.c.", age_old: "0 a 9 años", price: 300250)
InsurancePrice.create(vehicle_type: "Autos de negocios y Taxis", size: "Menos de 1500 c.c.", age_old: "Más de 10 años", price: 374950)
InsurancePrice.create(vehicle_type: "Autos de negocios y Taxis", size: "De 1500 a 2500 c.c.", age_old: "0 a 9 años", price: 373000)
InsurancePrice.create(vehicle_type: "Autos de negocios y Taxis", size: "De 1500 a 2500 c.c.", age_old: "Más de 10 años", price: 460900)
InsurancePrice.create(vehicle_type: "Autos de negocios y Taxis", size: "Más de 2500 c.c.", age_old: "0 a 9 años", price: 481300)
InsurancePrice.create(vehicle_type: "Autos de negocios y Taxis", size: "Más de 2500 c.c.", age_old: "Más de 10 años", price: 564700)
InsurancePrice.create(vehicle_type: "Buses y Busetas de Servicio Público", size: "Urbano", age_old: nil, price: 703900)
InsurancePrice.create(vehicle_type: "Servicio Público Intermunicipal", size: "Menor de 10 pasajeros", age_old: nil, price: 710350)
InsurancePrice.create(vehicle_type: "Servicio Público Intermunicipal", size: "Más de 10 pasajeros", age_old: nil, price: 1030900)

#mercol = Agreement.create(agreement_no: 10, name: 'Automóvil Club Colombia', active: true, mail_domain: 'acc.com.co')
#mercol = Agreement.create(agreement_no: 11, name: 'Coderia', active: true, mail_domain: 'hotmail.com')

#LocationType.create(name: 'Descuento')
#LocationType.create(name: 'Gasolinera')
#LocationType.create(name: 'Parqueadero')
#LocationType.create(name: 'Diversión')

#Location.create(name: 'CityParking', lat: 4.6768521, long: -74.0518781, location_type_id: 3, address: 'CRA 15 # 93-09', phone: '2579025')
#Location.create(name: 'CityParking', lat: 4.680051, long: -74.038948, location_type_id: 3, address: 'CL 100 # 7-33 CAPITAL TOWER', phone: '5233035 ext 111')
#Location.create(name: 'CityParking', lat: 4.693958, long: -74.050839, location_type_id: 3, address: 'AV 19 #106 A-45 FRISBY', phone: '2141197')
#Location.create(name: 'CityParking', lat: 4.682182, long: -74.049151, location_type_id: 3, address: 'CL 97 #15 -21', phone: '6915237')
#Location.create(name: 'Terpel', lat: 4.673912, long: -74.088492, location_type_id: 2, address: 'Avenida Carrrera 68 #67B05', phone: '3293011')
#Location.create(name: 'Terpel', lat: 4.668052, long: -74.109703, location_type_id: 2, address: 'Cra 72 # 49-48', phone: '4166497')
#Location.create(name: 'Terpel', lat: 4.655669, long: -74.114628, location_type_id: 2, address: 'Cra 69D No.32A-66', phone: '4168935')
#Location.create(name: 'Terpel', lat: 4.640631, long: -74.115386, location_type_id: 2, address: 'AVENIDA 68 NO. 17-65', phone: '2605308')
#Location.create(name: 'DIAGNOSTIYÁ', lat: 4.643379, long: -74.136477, location_type_id: 1, address: 'Cra.73 # 77A-62', phone: '7450298', description: 'Reciba un 20% de descuento en la revisión técnico mecánica para su vehículo')
#Location.create(name: 'DIAGNOSTIYÁ', lat: 4.623555, long: -74.102033, location_type_id: 1, address: 'AV. CALLE 13 No.43-02', phone: '2605308', description: 'Reciba un 20% de descuento en la revisión técnico mecánica para su vehículo')
#Location.create(name: 'TELLANTAS', lat: 4.690777, long: -74.038222, location_type_id: 1, address: 'Calle 110 No. 9-04 ', phone: '2145548', description: 'Reciba descuentos en la compra de aceites, filtros, llantas, accesorios de lujo, mantenimiento preventivo y correctivo, baterías y revisión técnico mecánica')
#Location.create(name: 'DACO TRADING', lat: 4.682466, long: -74.043250, location_type_id: 1, address: 'Calle 68 #27', description: 'En el Batericenter obtendrán revisión de baterías y plumillas')


#Perk.create(name: 'DIAGNOSTIYÁ', description: 'Reciba un 20% de descuento en la revisión técnico mecánica para su vehículo')
#Perk.create(name: 'TELLANTAS', description: 'Reciba descuentos en la compra de aceites, filtros, llantas, accesorios de lujo, mantenimiento preventivo y correctivo, baterías y revisión técnico mecánica')
#Perk.create(name: 'DACO TRADING', description: 'En el Batericenter obtendrán revisión de baterías y plumillas')
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
end