class WannabeAGuestController < ApplicationController

	respond_to :html, :xml, :json

	def index
	end

	def doit
		@name = params[:name] 
		MultiMailer.wannabe_a_guest(@name, params[:email], params[:text]).deliver
		respond_with(@name)
	end
end
