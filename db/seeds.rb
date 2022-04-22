# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
User.destroy_all
Tree.destroy_all

puts "Creating users..."

paul = User.create(email: 'paul@localhost.me', password: '123456', first_name: 'Paul', last_name: 'Schauss')
jo = User.create(email: 'josephine@arbre.com', password: '123456', first_name: 'Josephine', last_name: 'Lazzone')
ben = User.create(email: 'ben@arbre.fr', password: 'secret', first_name: 'Benjamin', last_name: 'Coca-Cola')

puts "Created Paul, Jo and Ben"

puts "Creating trees..."
pommier = Tree.create!(name: "Pommier de polo",
                       price: 140,
                       address: "Balmaseda - Antuñano errepidea, 48800 Balmaseda, Espagne",
                      #  latitude: 43.17080922197847,
                      #  longitude: -3.2028580556309416,
                       quantity_by_year: 8,
                       fruit: "Apple",
                       description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                       user: paul)

file = URI.open('https://www.consoglobe.com/wp-content/uploads/2020/12/taille-pommier_shutterstock_72593407.jpg')
pommier.photo.attach(io: file, filename: 'pommier.png', content_type: 'image/png')

puts "Created #{pommier.name}"

poirier = Tree.create!(name: "Abricotier de benjos",
                       price: 180,
                       address: "56A Shoreditch High St, London E1 6PQ",
                      #  longitude: -0.076716,
                      #  latitude: 51.524072,
                       quantity_by_year: 12,
                       fruit: "Apricot",
                       description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                       user: ben)

file = URI.open('https://www.gammvert.fr/conseils/sites/default/files/styles/main_image/public/poirier-jr.jpg?itok=JmXIv08z')
poirier.photo.attach(io: file, filename: 'poirier.png', content_type: 'image/png')

puts "Created #{poirier.name}"

cocotier = Tree.create!(name: "Cocotier de jojo",
                        price: 220,
                        address: "Konni, Inde",
                        # longitude: 77.12965742449501,
                        # latitude: 9.321631270506778,
                        quantity_by_year: 4,
                        fruit: "Coconut",
                        description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                        user: jo)

file = URI.open('https://jardinage.lemonde.fr/images/dossiers/historique/mini/cocos-nucifera-184616-650-325.jpg')
cocotier.photo.attach(io: file, filename: 'cocotier.png', content_type: 'image/png')

puts "Created #{cocotier.name}"
puts "Finished!"
