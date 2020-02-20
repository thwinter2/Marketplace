class UserMailer < ApplicationMailer
  default from: 'csc517.team1000@gmail.com'

  ## Email for OTP
  def otp_email
    @otp  = "123456"
    mail(to: current_user.email, subject: 'OTP for Quick Purchase')
  end

  ## Email for list of purchases made
  def purchase_email(user_email, purchase_items)
  	## To be implemented
    @purchase_items  = purchase_items
    mail(to: user_email, subject: 'Thank you for your purchase!')
  end

  ## Email for when items become available in wishlist
  def wishlist_email(user_email)
  	## To be implemented
    @otp  = "123456"
    mail(to: user_email, subject: 'Wishlist item/s available to buy!!!')
  end

  ## Email for when returned items request is approved
  def return_approval_email
  	## To be implemented
    # @url  = 'http://example.com/login'
    # mail(to: @email, subject: 'Returned Items Request Approved')
  end
end