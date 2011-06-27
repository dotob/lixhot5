class CheckinController < ApplicationController

	respond_to :html, :xml, :json

	def doit
    @guest = Guest.find(params[:guest_id])
		if @guest
			if params[:iscoming] == "1"
				@guest.iscoming = true;
				@guest.gift_id = params[:gift_id]
			else
				@guest.iscoming = false;
			end
			@guest.message = params[:message]
			@guest.save
		end
		respond_with(@guest)
	end
end
