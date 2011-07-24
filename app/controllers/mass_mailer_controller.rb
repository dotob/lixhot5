class MassMailerController < ApplicationController
	respond_to :html, :xml, :json

	def index
		@guests = Guest.all()
	end

	def doit
		@recipients = Array.new()
		# check for single id
		if !params[:guest_id].nil? && params[:guest_id].to_i>0
			@recipients << Guest.find(params[:guest_id])
		elsif !params[:guest_ids].nil? && params[:guest_ids].length>0
			for gid in %w(params[:guest_ids]) do
				@recipients << Guest.find(gid)
			end
		else
			to_group = params[:to]	
			# collect recipients
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
