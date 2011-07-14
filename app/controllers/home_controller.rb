class HomeController < ApplicationController

	respond_to :html, :xml, :json

  def index
		guest_count = Guest.find_all_by_iscoming(true).count + 20
		gifts_with_no_guests = Gift.where("guest_count <= ?", guest_count).find_all{|g| g.guest.nil?} 
		
		@somegifts = gifts_with_no_guests#[0..5]
		respond_with(@somegifts)
  end

end
