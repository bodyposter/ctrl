class UserMailer < ActionMailer::Base
 default :from => "control.crm.bhp@gmail.com"

def registration_confirmation(uzytkownik)
    @uzytkownik = uzytkownik
    mail(:to => "#{uzytkownik.imie} #{uzytkownik.nazwisko} <#{uzytkownik.email}>", :subject => "Potwierdzenie rejestracji")
 end
end