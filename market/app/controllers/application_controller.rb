class ApplicationController < ActionController::Base
     protect_from_forgery with: :exception

     before_action :configure_permitted_parameters, if: :devise_controller?

     private
     def reroute_visitor
     	redirect_to items_url unless !current_user.nil?
     end

     def reroute_visitor_and_regular_user
     	redirect_to items_url unless !current_user.nil? and current_user.admin?
     end

     def keep_admin_logged_in
          puts("keep_admin_logged_in")
          sign_out(:user)
          sign_in(User.first, :bypass => true)
          redirect_to users_url
     end

     def set_cart
          if user_signed_in?
               @cart = Cart.find_by(user_id: current_user.id)
               if !@cart
                    puts '**********************************************************'
                    puts '***               Cart doesn\'t exist                  ***'
                    puts '***               Creating new cart                    ***'
                    puts '***                                                    ***'
                    puts '**********************************************************'
                    @cart = Cart.new({user_id: current_user.id})
                    if @cart.save
                         puts 'Saved!'
                    end
               else
                    puts '**********************************************************'
                    puts '***                 Cart does exist                    ***'
                    puts '***                                                    ***'
                    puts '***                                                    ***'
                    puts '**********************************************************'
                    puts @cart
               end
          end
     end

     protected

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :phone, :dob, :street_addres, :city, :state, :zip)}

               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
          end
end
