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

[Token, Dosen, Mahasiswa, Event, Penguji, Pembimbing, Period, Room, ScheduledEvent].each(&:delete_all)
@listDosen = []
@listMahasiswa = []
@index = 0
@listRoom = []
@listCategory = [0, 1, 2, 3, 4]


#######################################################################
@listEmail = ["13514052@std.stei.itb.ac.id", "ikhwan.m1996@gmail.com", "ldfmuslimstei@gmail.com"]
@listToken = []

@listToken << "{\"token\":{\"email\":\"13514052@std.stei.itb.ac.id\", \"client_id\":\"1031302495796-ij3m49g7g0p5p3523c9vltui4d1csafa.apps.googleusercontent.com\", \"access_token\":\"ya29.GltUBFhCKgXcnQ-4gbe2tp0ghfMKS-SwhmnNBy3GGb9MqaP-f2TfmbJYSLxl8lrN3J92LpTqIz--gPBq5OLsZLVQVwLot6-cxpPzKg-GCFEOttz7PoewmnJoHaCX\", \"refresh_token\":\"1/W-T1ITcO3keIdCgmGPIV62tfAyLSj98f0keg4KacZ-U\", \"scope\":[\"https://www.googleapis.com/auth/calendar\"], \"expiration_time_millis\":1495638351000}}"

@listToken << "{\"token\":{\"email\":\"ikhwan.m1996@gmail.com\", \"client_id\":\"1031302495796-ij3m49g7g0p5p3523c9vltui4d1csafa.apps.googleusercontent.com\", \"access_token\":\"ya29.GltUBGKQ5k4Lfj5WYad5JiVKjNAVP5QphP9Ald4Jictmn08gVxXlHCWiXDztM6Klx3ylAQTRItrC_X2DvaDUwJLnhXTp1x0kTNWPo7XtVOsRrQdAfZi-AYLUfJjH\", \"refresh_token\":\"1/rOry9TqPXSsQf5BivEFN5D6bS2LldLYTyTq_172LQio\", \"scope\":[\"https://www.googleapis.com/auth/calendar\"], \"expiration_time_millis\":1495638207000}}"

@listToken << "{\"token\":{\"email\":\"ldfmuslimstei@gmail.com\", \"client_id\":\"1031302495796-ij3m49g7g0p5p3523c9vltui4d1csafa.apps.googleusercontent.com\", \"access_token\":\"ya29.GltUBAvbCLiYK0nUgKl2fOI32liZa6jhDT9FQDHYKQjtz6ru8mDfrxHXk2eStUOKLINWK1oetvsrqT7GD7Bs-PAIqXOnq-E2Q6AFgTdTGq8A-edsoERzHzojYu26\", \"refresh_token\":\"1/0o70dzzF0wKk4WW9hNDq3NriZskVVeIg1GusDqJbyVQ\", \"scope\":[\"https://www.googleapis.com/auth/calendar\"], \"expiration_time_millis\":1495638408000}}"

#######################################################################
Dosen.populate 7 do |dosen|
  dosen.NIP   = '1234567'+rand(10..99).to_s
  dosen.email = @listEmail[@index]
  dosen.name  = Faker::Name.name
  dosen.encrypted_password = "123456"
  dosen.sign_in_count = 0
  @listDosen << dosen
  @index = @index + 1
end
@index = 0

# @listDosen = Dosen.all
@dosenlen = @listDosen.length
#######################################################################
Token.populate 7 do |token|
  token.owner_id = @listDosen[@index].NIM
  token.token_json = @listToken[@index]
  @index = @index + 1
end
@index = 0
#######################################################################
Mahasiswa.populate 20 do |mahasiswa|
  mahasiswa.NIM       = '135140'+rand(10..99).to_s
  mahasiswa.email     = Faker::Internet.email
  mahasiswa.name      = Faker::Name.name
  mahasiswa.encrypted_password = "123456"
  mahasiswa.sign_in_count = 0
  @listMahasiswa << mahasiswa
end
#######################################################################
Pembimbing.populate 10 do |pembimbing|
  pembimbing.mahasiswa_id = @listMahasiswa[@index].NIM
  pembimbing.dosen_id     = @listDosen[rand(@dosenlen)].NIP
  @index = @index + 1
end
@index = 0
#######################################################################
Penguji.populate 10 do |penguji|
  penguji.mahasiswa_id  = @listMahasiswa[@index].NIM
  penguji.dosen_id      = @listDosen[rand(@dosenlen)].NIP
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

#event room
#######################################################################
Event.populate 20 do |event|
  event.start       = Time.at(Time.now.to_i + rand(2.months))
  event.end         = Time.at(event.start.to_i + rand(3.hours))
  event.name        = Faker::Company.buzzword
  event.owner_id    = @listDosen[rand(@dosenlen)].NIP
  event.event_type  = 0
end
Event.populate 5 do |event|
  event.start       = Time.at(Time.now.to_i + rand(2.months))
  event.end         = Time.at(event.start.to_i + rand(3.hours))
  event.name        = Faker::Company.buzzword
  event.owner_id    = @listDosen[rand(@dosenlen)].NIP
  event.event_type  = 1
end

Event.populate 5 do |event|
  event.start       = Time.at(Time.now.to_i + rand(2.months))
  event.end         = Time.at(event.start.to_i + rand(3.hours))
  event.name        = Faker::Company.buzzword
  event.owner_id    = @listDosen[rand(@dosenlen)].NIP
  event.event_type  = 2
end

Event.populate 5 do |event|
  event.start       = Time.at(Time.now.to_i + rand(2.months))
  event.end         = Time.at(event.start.to_i + rand(3.hours))
  event.name        = Faker::Company.buzzword
  event.owner_id    = @listDosen[rand(@dosenlen)].NIP
  event.event_type  = 3
end
#######################################################################
# ScheduledEvent.populate 10 do |scheduled|
#   scheduled.start       = Time.at(Time.now.to_i + rand(1.months))
#   scheduled.end         = Time.at(scheduled.start.to_i + 1.hours)
#   scheduled.event_name  = "sidang"
#   scheduled.event_type  = 0
#   scheduled.student_id  = @listMahasiswa[@index].NIM
#   scheduled.room_id     = @listRoom[rand(2)].id
#   scheduled.kategori    = @listCategory[rand(4)]
#   @index = @index + 1
# end
# @index = 0
########################################################################

puts "DOSEN=============="
@listDosen.each do |d|
  puts d.name
end
puts "Mahasiswa=============="
@listMahasiswa.each do |m|
  puts m.name
end