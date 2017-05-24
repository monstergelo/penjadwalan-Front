# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Category.populate 20 do |category|
#   category.name = Populator.words(1..3).titleize
#   Product.populate 10..20 do |product|
#     product.category_id = category.id
#     product.name = Populator.words(1..5).titleize
#     product.description = Populator.sentences(1..2)
#     product.price = [4.99, 19.95, 100]
#     product.created_at = 2.years.ago..Time.now
#   end
# end
#
# Person.populate 100 do |person|
#   person.name    = Faker::Name.name
#   person.company = Faker::Company.name
#   person.email   = Faker::Internet.email
#   person.phone   = Faker::PhoneNumber.phone_number
#   person.street  = Faker::Address.street_address
#   person.city    = Faker::Address.city
#   person.state   = Faker::Address.state_abbr
#   person.zip     = Faker::Address.zip_code
# end

[Dosen, Mahasiswa, Event, Penguji, Pembimbing, Period, Room, ScheduledEvent].each(&:delete_all)
@listDosen = []
@listMahasiswa = []
@index = 0
@listRoom = []

#######################################################################
Dosen.populate 10 do |dosen|
  dosen.NIP   = '1234567'+rand(10..99).to_s
  dosen.email = Faker::Internet.email
  dosen.nama  = Faker::Name.name
  @listDosen << dosen
end
#######################################################################
Mahasiswa.populate 10 do |mahasiswa|
  mahasiswa.NIM       = '135140'+rand(10..99).to_s
  mahasiswa.email     = Faker::Internet.email
  mahasiswa.kategori  = 0
  mahasiswa.nama      = Faker::Name.name
  @listMahasiswa << mahasiswa
end
#######################################################################
Event.populate 20 do |event|
  event.start       = Time.at(Time.now.to_i + rand(2.months))
  event.end         = Time.at(event.start.to_i + rand(3.hours))
  event.name        = Faker::Company.buzzword
  event.owner_id    = @listDosen[rand(10)].NIP
  event.event_type  = 8
end
#######################################################################
Pembimbing.populate 10 do |pembimbing|
  pembimbing.mahasiswa_id = @listMahasiswa[@index].NIM
  pembimbing.dosen_id     = @listDosen[rand(10)].NIP
  @index = @index + 1
end
@index = 0
#######################################################################
Penguji.populate 10 do |penguji|
  penguji.mahasiswa_id  = @listMahasiswa[@index].NIM
  penguji.dosen_id      = @listDosen[rand(10)].NIP
  @index= @index + 1
end
@index = 0
######################################################################
Period.populate 3 do |period|
  period.start        = Time.at(Time.now.to_i + rand(2.months))
  period.end          = Time.at(period.start.to_i + 1.months)
  period.period_type  = @index
  @index= @index + 1
end
@index = 0
#######################################################################
Room.populate 2 do |room|
  room.email  = Faker::Internet.email
  room.name   = Faker::Company.name
  @listRoom << room
end
#######################################################################
ScheduledEvent.populate 10 do |scheduled|
  scheduled.start       = Time.at(Time.now.to_i + rand(1.months))
  scheduled.end         = Time.at(scheduled.start.to_i + 1.hours)
  scheduled.event_name  = "sidang"
  scheduled.event_type  = 0
  scheduled.student_id  = @listMahasiswa[@index].NIM
  scheduled.room_id     = @listRoom[rand(2)].name
  @index = @index + 1
end
@index = 0
########################################################################

puts "DOSEN=============="
@listDosen.each do |d|
  puts d.nama
end
puts "Mahasiswa=============="
@listMahasiswa.each do |m|
  puts m.nama
end