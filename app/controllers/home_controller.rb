class HomeController < ApplicationController

	respond_to :html, :xml, :json

  def index
		@somegifts = Gift.all 
		respond_with(@somegifts)
  end

end
