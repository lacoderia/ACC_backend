class RideMailer < ActionMailer::Base
  default from: "soporteapps@acc.com.co"

  def book_email(user, passenger, ride)
  	@user = user
  	@passenger = passenger
  	@ride = ride
  	mail(to: @user.email, subject: 'Cupo reservado comunidad Carpooling')
  end
end
