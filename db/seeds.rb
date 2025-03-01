# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
books = [
  { title: "The Shadow of the Forgotten", author: "Eleanor Wren" },
  { title: "Echoes in the Mist", author: "Marcus Holloway" },
  { title: "The Last Ember", author: "Lila Thorn" },
  { title: "Whispers of the Ancient Sea", author: "Julian Ashford" },
  { title: "The Clockmaker's Daughter", author: "Clara Merriweather" },
  { title: "Beneath the Crimson Sky", author: "Victor Kane" },
  { title: "The Alchemist's Apprentice", author: "Felix Blackwood" },
  { title: "The Garden of Lost Memories", author: "Isabella Marlowe" },
  { title: "The Silent Symphony", author: "Oliver Graves" },
  { title: "The Forgotten Key", author: "Sophia Hartwell" },
  { title: "The Starless Horizon", author: "Nathaniel Cross" },
  { title: "The Glassblower's Legacy", author: "Eliza Fairchild" },
  { title: "The Crimson Veil", author: "Adrian Locke" },
  { title: "The Lighthouse Keeper's Secret", author: "Margaret Hale" },
  { title: "The Clockwork Raven", author: "Edgar Whitlock" },
  { title: "The Sapphire Flame", author: "Cassandra Vale" },
  { title: "The Forgotten City", author: "Arthur Pendleton" },
  { title: "The Moonlit Garden", author: "Evelyn Rosewood" },
  { title: "The Silver Compass", author: "Theodore Finch" },
  { title: "The Hidden Library", author: "Penelope Ashworth" }
]

books.each do |book|
  Book.create!(title: book[:title], author: book[:author])
end

puts "Created #{books.size} books."
