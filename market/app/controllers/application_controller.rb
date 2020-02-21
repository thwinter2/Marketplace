class ApplicationController < ActionController::Base
     protect_from_forgery with: :exception

     before_action :configure_permitted_parameters, if: :devise_controller?

     private
     def reroute_visitor
     	redirect_to items_url unless !current_user.nil?
     end

     def reroute_visitor_and_regular_user
     	redirect_to items_url unless !current_user.nil? or !current_user.admin?
     end

     protected

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :phone, :dob, :street_addres, :city, :state, :zip)}

               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
          end
end
