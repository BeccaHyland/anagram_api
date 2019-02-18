# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require './lib/dictionary.rb'
require './lib/progress_bar.rb'

puts "Cleaning the database before seeding. This will take a few minutes..."
Word.destroy_all

if Rails.env == 'development' || Rails.env == 'production'
  puts "Database cleaned, now seeding all words in the English dictionary:"
  progress_bar = ProgressBar.new(235886)

  dictionary_for_seeds.each do |word_hash|
    Word.create!(
      spelling: word_hash[:spelling],
      length: word_hash[:length]
    )
    progress_bar.increment
  end
  puts "Success! Anagram API database seeding complete."
end
