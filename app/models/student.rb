require_relative '../../db/config'
require 'byebug'
require 'date'

class Student < ActiveRecord::Base
# implement your Student model here
attr_accessor :name, :first_name, :last_name, :gender, :birthday
	validates :email, uniqueness: true, format: { with: /\w+@\w+\.\w{2,}/, message: 'must be valid email' }
	validates :age, numericality: { greater_than: 4 }
	validates :phone, format: { with: /.*\d{3}.*\d{3}.*\d{4}.*/, message: 'must be at least 10 digit phone number' }

	def name
		@student = Student.new
		@student.name = "#{first_name} #{last_name}"
	end

	def age
		# byebug
		now = Date.today
		age = now.year - birthday.year - 1
	end
end
