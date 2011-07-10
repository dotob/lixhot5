class HomeController < ApplicationController

	respond_to :html, :xml, :json

  def index
		guest_count = Guest.find_all_by_iscoming(true).count + 20
		@somegifts = Gift.where("guest_count <= ?", guest_count) 
		respond_with(@somegifts)
  end

end
