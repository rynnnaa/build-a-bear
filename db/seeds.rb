# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DATA = {
  :user_keys =>
    ["name", "email", "password_digest", "age"],
  :users => [
    ["Bobby", "bobby-o@gmail.com", "123", 7],
    ["Natalia", "natty-o@gmail.com", "123", 10],
    ["Ashton", "ash-o@gmail.com", "123", 17],
    ["Mo", "mo-o@gmail.com", "123", 14],
    ["Lillian", "lil-o@gmail.com", "123", 13],
    ["Connie", "con-o@gmail.com", "123", 12],
    ["Shelly", "shell-o@gmail.com", "123", 11]
  ],
  :animal_keys =>
    ["kind", "size", "demeanor", "color"],
  :animals => [
    ["Tiger", "Small", "Happy", "Orange"],
    ["Bear", "Large", "Timid", "Brown"],
    ["Dinosaur", "Small", "Goofy", "Green"],
    ["Giraffe", "Large", "Happy", "Yellow"],
    ["Dog", "Medium, Playful", "White"],
    ["Hippo", "Ginormous", "Sleepy", "Purple"],
    ["Cat", "Small", "Angry", "Orange"]
  ], 
  :admins => [
    "Dumbledore",
    "Joey"
  ]
}

def main
  make_users
  make_admin
  make_animals_and_stuffed_animals
end

def make_users
  DATA[:users].each do |user|
    new_user = User.new
    user.each_with_index do |attribute, i|
      new_user.send(DATA[:user_keys][i]+"=", attribute)
    end
    new_user.save
  end
end

def make_admin
  DATA[:admins].each do |name|
    User.create(name: name, admin: true, password: 'password')
  end
end

def make_animals_and_stuffed_animals
  DATA[:animals].each do |animal|
    new_animal = Animal.new
    animal.each_with_index do |attribute, i|
      new_animal.send(DATA[:animal_keys][i] + "=", attribute)
    end
    rand(1..8).times do
      customers = []
      User.all.each {|u| customers << u if u.admin != true}
      new_animal.users << customers[rand(0...customers.length)]
    end
    new_animal.users.each {|c| c.save}
    new_animal.save
  end
end

main
