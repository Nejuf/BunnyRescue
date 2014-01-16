class Bunny < ActiveRecord::Base
	validates :name, presence: true
	validates :name, length: { in: 1..30 }

	validates :age, numericality: { greater_than_or_equal_to: 0, only_integer: true }
	

end
