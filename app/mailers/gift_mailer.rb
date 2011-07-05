class GiftMailer < ActionMailer::Base
  default :from => "wir@lixhot.de"

	def registration_confirmation(guest)  
		@guest = guest
    mail(:to => guest.email, :subject => "lixhot 5, party: du bist dabei")  
  end
end
