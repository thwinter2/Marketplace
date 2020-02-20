# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    # Set up a temporary wishlist for the preview
    wishlist = Wishlist.new(user: "6")

    UserMailer.with(wishlist: wishlist).welcome_email
  end
end
