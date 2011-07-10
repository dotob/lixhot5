class MassMailerController < ApplicationController
	respond_to :html, :xml, :json

	def index
	end

	def doit
		to_group = params[:to]	
		# collect recipients
		@recipients = Array.new()
		case to_group
  		when "1"
				@recipients = Guest.all()
  		when "2"
				@recipients = Guest.find_all_by_iscoming(true)
  		when "3"
				@recipients = Guest.find_all_by_iscoming(false)
  		when "4"
				@recipients = Guest.where("iscoming IS NOT NULL")
  		when "5"
				@recipients = Guest.where(:iscoming => nil)
		end
		# send mail
		for r in @recipients do
			# work on text
			text = params[:text].gsub("@@name@@", r.name)
			MultiMailer.mass_mailer(r, params[:subject], text).deliver
		end
		respond_with(@recipients)
	end
end
