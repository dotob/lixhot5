class FindguestController < ApplicationController
	respond_to :html, :xml, :json

	def exists
		@found = Guest.find_by_email(params[:search])
		if @found
			result = [@found , @found.gift]
		else
			result = @found
		end
		respond_with(result)
	end
end
