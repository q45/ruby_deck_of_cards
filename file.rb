class Application 
	def initialize
		@decks = []
	end	

	def << deck
		@decks << deck
	end

	def play
		display_decks
		puts "Pick a deck: "
		deck = get_deck
		deck.play
	end

	def display_decks
		@decks.each do |deck|
			puts deck.name
		end
	end

	def get_deck
		name = gets.chomp
		@decks.detect do |deck|
			deck.name == name
		end
	end


end

class Card
	attr_accessor :front, :back
	def initialize(front, back)
		puts "#{front} | #{back}"
		@front = front.upcase
		@back = back
	end

	def correct?(guess)
		guess == @back
	end

	def play
		puts "#{front} > "
		guess = gets.chomp
		if correct? guess
			puts "Correct"
		else 
			puts "Incorrect the answer was #{back}"
		end
	end
 
end

class Deck

	attr_reader :cards, :name
	def initialize(name)
		@name = name
		@cards = []
	end

	def << card
		@cards << card
	end

	def play
	 shuffle
	 puts "Playing the #{name} deck"

	 	@cards.each do |card|
			
			card.play
		end
	end

	def shuffle
		@cards.shuffle!
	end
end

card1 = Card.new("Cat", "Neko")
card2 = Card.new("Dog", "Inu")
card3 = Card.new("Hello", "Malo")
puts card1.inspect

deck = Deck.new("Japanese") 
puts deck.inspect
deck << card1
deck << card2 
deck << card3

deck2 = Deck.new("Tongan")

app = Application.new
puts app.inspect
app << deck
app << deck2
app.play


