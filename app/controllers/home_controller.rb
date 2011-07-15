class HomeController < ApplicationController

	respond_to :html, :xml, :json

  def index
		guest_count = Guest.find_all_by_iscoming(true).count + 200
		gifts_with_no_guests = Gift.where("guest_count <= ?", guest_count).find_all{|g| g.guest.nil?} 

		nodups = Set.new()				

		@somegifts = Array.new()
		for g in gifts_with_no_guests do
			if nodups.add?(g.name)
				@somegifts << g
			end
		end 
		respond_with(@somegifts)
  end

end
