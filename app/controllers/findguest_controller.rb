class FindguestController < ApplicationController
	respond_to :html, :xml, :json

	def exists
		@found = Guest.find_by_email(params[:search])
		if @found
			respond_with(@found.id)
		else
			respond_with(-1)
		end
	end
end
