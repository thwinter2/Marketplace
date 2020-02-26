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
    mail(to: user_email, subject: 'An admin has given feedback on your special item request!') do |format|
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

  ## Email for when items become available in wishlist
  def wishlist_email(user_email)
  	## To be implemented
    puts("--------------Wishlist Mailer--------")
    # @otp  = "123456"
    # mail(to: user_email, subject: 'Wishlist item/s available to buy!!!')
  end

  ## Email for when returned items request is approved
  def return_approval_email
  	## To be implemented
    # @url  = 'http://example.com/login'
    # mail(to: @email, subject: 'Returned Items Request Approved')
  end
end