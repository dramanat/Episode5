require 'rubygems'
require 'bundler/setup'

require_relative 'db/setup'
require_relative 'models/page'
require_relative 'models/book'

page = Page.create(starting_point: true, content: "You wake up on a road. It's foggy and damp. You have 30 gold pieces and a bacon sandwich. Which do you choose?")
Page.create(conclusion: true, parent_id: page.id, content: "Go into the forest", result: "WINNER: you won 30 gold pieces!", conclusion: true)
Page.create(conclusion: true, parent_id: page.id, content: "Walk down the road", result: "LOSER: you've been eaten by a shark", conclusion: true)

book = Book.new(page)

until book.complete_game? do
	puts book.current_page.content
	puts "your options: "
	puts "  - [#{book.current_page.options.first.content}]"
	puts "  - [#{book.current_page.options.last.content}]"
	puts "What do you want to do? Enter A or B"
	
	book.input( gets )

end
puts "------------------------------------------"
puts "|                                        |"
puts "|                                        |"
puts "|          ADVENTURE COMPLETE            |"
puts "|                                        |"
puts "|                                        |"
puts "------------------------------------------"


puts book.current_page.result

puts "hope you won!"
