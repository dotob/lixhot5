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

  def wannabe_a_guest(name, email, text)  
		@name = name
		@email = email
		@text = text
    mail(:to => "wir@lixhot.de", :subject => "lixhot 5, mitfeiern")  
  end

  def mass_mailer(guest, subject, text)  
    @text = text
    mail(:to => guest.email, :subject => subject)  
  end
end

