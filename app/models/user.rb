class User < ActiveRecord::Base
	validates_presence_of :username, :email
	validates_uniqueness_of :username, :email
	validates_length_of :username, :name, :minimum => 3, :maximum => 50
	validates_length_of :email, :minimum => 5, :maximum => 50
	acts_as_birthday :birthday

	def age
		birthday_age
	end
end
