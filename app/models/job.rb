class Job < ActiveRecord::Base
	belongs_to :boat

	validates :jname, uniqueness: true

	validates_numericality_of :cost, :greater_than =>
	1000, :only_integer => true, :allow_nil => true, :message => "Must be
	greater than 1000"

	validates_length_of :cargodesc, minimum: 50

	validates :origin, :location, inclusion: { in: %w(New\ York Florida Russia England Ireland Norway Singapore New\ Jersey), message: "%{value} is not a valid location"}
end
