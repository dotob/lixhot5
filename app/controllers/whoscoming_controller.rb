class WhoscomingController < ApplicationController

	respond_to :html, :xml, :json

	def doit
    @guests = Guest.where(:iscoming => true)
		respond_with(@guests)
	end
end
