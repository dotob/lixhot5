class Guest < ActiveRecord::Base
	belongs_to :gift
  validates_uniqueness_of :email, :case_sensitive => false

	def exists
		where(:email => :search).exists?
	end
end
