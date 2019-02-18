# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require './lib/dictionary.rb'

Word.destroy_all

if Rails.env == 'development' || Rails.env == 'production'
  dictionary_array_of_hashes.each do |word_hash|
    Word.create!(
      spelling: word_hash.spelling,
      length: word_hash.length
    )
  end
  puts "Anagram API database successfully seeded"
end
