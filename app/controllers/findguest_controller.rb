class FindguestController < ApplicationController
	respond_to :html, :xml, :json

	def exists
		@found = Guest.where("lower(email) = ?", params[:search].downcase).at(0)
		if @found
			result = [@found , @found.gift]
		else
			result = @found
		end
		respond_with(result)
	end
end
