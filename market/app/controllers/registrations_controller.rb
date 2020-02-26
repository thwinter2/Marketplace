class RegistrationsController < Devise::RegistrationsController

	skip_before_action :require_no_authentication, only: [:new, :create]
	before_action :raise_admin_flag?, only: [:create]
	after_action :keep_admin_logged_in, only: [:create]
	#after_action redirect_to users_url, only: [:create]

	def keep_admin_logged_in
		if raise_admin_flag?
    		sign_out(:user)
    		sign_in(User.first, :bypass => true)
    		admin_flag = false
    	end
    end

    def raise_admin_flag?
    	if !current_user.nil? and current_user.admin?
    		admin_flag = true
    	else
    		admin_flag = false
    	end
    end

	def new
		super
	end

end
