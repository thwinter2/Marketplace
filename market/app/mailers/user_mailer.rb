class UserMailer < ApplicationMailer
  default from: 'csc517.team1000@gmail.com'

  ## Email for OTP
  def otp_email(user_email, otp)
    @otp = otp
    mail(to: user_email, subject: 'OTP for Purchase') do |format|
      format.html
    end
  end

  ## Email for list of purchases made
  def special_item_email(user_email)
    mail(to: user_email, subject: 'An administrator has given feedback on your special item request!') do |format|
      format.html
    end
  end

  ## Email for list of purchases made
  def purchase_email(user_email, cart)
    @cart  = cart
    puts(@cart)
    mail(to: user_email, subject: 'Thank you for your recent purchase!') do |format|
      format.html
    end
  end

  def return_request_email(user_email)
    mail(to: user_email, subject: 'An administrator has given feedback on your return request!') do |format|
      format.html
    end
  end

  def availability_email(user_email)
    mail(to: user_email, subject: 'An item you were watching is back in stock!') do |format|
      format.html
    end
  end
end