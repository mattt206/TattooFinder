# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'

puts "Cleaning database..."
Provider.destroy_all
Booking.destroy_all
Review.destroy_all
Service.destroy_all
User.destroy_all

puts "creating privders..."
provider1 = Provider.new(name: "new school Studio", description: "Somos nuevos en la ciudad de medellin, directamente desde new york", category: ['new school', 'ignorant', 'blackwork'], address: "calle 70 # nutibara", latitude: 0, longitude: 0, start_time: DateTime.now, close_time: DateTime.now )
photostudio = URI.open('https://i.pinimg.com/originals/d6/bd/37/d6bd379f3126df7e63186cd74dc78752.jpg')
provider1.photos.attach(io: photostudio, filename: 'studio.png', content_type: 'image/png')
photostudio2 = URI.open('https://www.greenretreats.co.uk/wp-content/uploads/Edge-Tattoo-Studio-4.5m-x-2.5m-11-1024x683.jpg')
provider1.photos.attach(io: photostudio2, filename: 'studio.png', content_type: 'image/png')
provider1.save
puts "providers ready"

puts "creating users..."
user1 = User.new(email: "kvond@gmail.com", password: "123456", nickname: "Katt-D", provider_id: provider1.id)
photo1 = URI.open('https://upload.wikimedia.org/wikipedia/commons/e/ee/KVD_2016_SEPHORA_WINDOW_037.jpg')
user1.photo.attach(io: photo1, filename: 'katvond.png', content_type: 'image/png')
user1.save

user2 = User.new(email: "paulb@gmail.com", password: "123456", nickname: "pualb", provider_id: provider1.id)
photo2 = URI.open('https://live.staticflickr.com/2944/15390181172_3db69db290_b.jpg')
user2.photo.attach(io: photo2, filename: 'paulbooth.png', content_type: 'image/png')
user2.save

user3 = User.new(email: "nunez@gmail.com", password: "123456", nickname: "nunez22")
photo3 = URI.open('https://vz.cnwimg.com/wp-content/uploads/2012/01/Chris-Nunez.jpg')
user3.photo.attach(io: photo3, filename: 'nunez.png', content_type: 'image/png')
user3.save

user4 = User.new(email: "user1@gmail.com", password: "123456", nickname: "juanjo")
puts "users ready"

puts "creating services..."
service1 = Service.create(style: "blackwork", price: 10, description: "wolf", user_id: user1.id)
photos1 = URI.open('https://i.pinimg.com/736x/16/28/b0/1628b044b8ad898c23e4fe61c1af40c3.jpg')
service1.photo.attach(io: photos1, filename: 'service41.png', content_type: 'image/png')
service1.save

service2 = Service.create(style: "old school", price: 10, description: "daga y ancla", user_id: user2.id)
photos2 = URI.open('https://i.pinimg.com/originals/89/f7/cc/89f7ccc6527d7fe0e36420f06fed3211.jpg')
service2.photo.attach(io: photos2, filename: 'service2.png', content_type: 'image/png')
service2.save

service3 = Service.create(style: "new school", price: 10, description: "big arm tattoo", user_id: user3.id)

photos3 = URI.open('https://nextluxury.com/wp-content/uploads/cool-black-arm-tattoo-koreacheon.jpg')
service3.photo.attach(io: photos3, filename: 'service3.png', content_type: 'image/png')
service3.save


service4 = Service.create(style: "old school", price: 10, description: "calavera", user_id: user2.id)
photos4 = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaZNP-yRon3XKbnbIndBeOB-zqPUUU7VSU6lxw09Pgn0J2suwCYNHMgJZODEFR8rLOMxs&usqp=CAU')
service4.photo.attach(io: photos4, filename: 'service4.png', content_type: 'image/png')
service4.save

puts "services ready"

puts "creating bookings..."
booking1 = Booking.new(user_id: user4.id, service_id: service1.id, start_time: DateTime.now,
                      end_time: DateTime.now, status: false, payment_status: "por validar")
booking1.save
booking2 = Booking.new(user_id: user1.id, service_id: service3.id, start_time: DateTime.now,
  end_time: DateTime.now, status: false, payment_status: "por validar")
booking2.save

puts "bookings ready"

review1 = Review.new(rating: 4, content: "rapido y me gusto el trabajo final", service_id: service1.id)
review1.save

# provider1 = Provider.new(name: "new school Studio", description: "Somos nuevos en la ciudad de medellin, directamente desde new york", category: ['new school', 'ignorant', 'blackwork'], address: "calle 70 # nutibara", latitude: 0, longitude: 0, start_time: DateTime.now, close_time: DateTime.now )
# photostudio = URI.open('https://i.pinimg.com/originals/d6/bd/37/d6bd379f3126df7e63186cd74dc78752.jpg')
# provider1.photos.attach(io: photostudio, filename: 'studio.png', content_type: 'image/png')
# photostudio2 = URI.open('https://www.greenretreats.co.uk/wp-content/uploads/Edge-Tattoo-Studio-4.5m-x-2.5m-11-1024x683.jpg')
# provider1.photos.attach(io: photostudio2, filename: 'studio.png', content_type: 'image/png')
# provider1.save

puts "all db ready"
