class CheckinController < ApplicationController

	respond_to :html, :xml, :json

	def doit
    @guest = Guest.find(params[:guest_id])
		if @guest
			@guest.message = params[:message]
			if params[:iscoming] == "1"
				@guest.iscoming = true;
				@guest.gift_id = params[:gift_id]
				GiftMailer.registration_confirmation(@guest).deliver
			else
				@guest.iscoming = false;
			end
			GiftMailer.registration_confirmation_to_us(@guest).deliver
			@guest.save
		end
		respond_with(@guest)
	end
end
