class Guest < ActiveRecord::Base
	belongs_to :gift

	def exists
		where(:email => :search).exists?
	end
end
