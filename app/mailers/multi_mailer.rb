class MultiMailer < ActionMailer::Base
  default :from => "wir@lixhot.de"

  def checkin_confirmation(guest)  
    @guest = guest
    mail(:to => guest.email, :subject => "lixhot 5, party: du bist dabei")  
  end

  def checkin_confirmation_to_us(guest)  
    @guest = guest
    mail(:to => guest.email, :subject => "lixhot 5, neue anmeldung")  
  end
end
