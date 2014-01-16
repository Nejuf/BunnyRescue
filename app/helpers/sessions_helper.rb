module SessionsHelper
	def current_user
		User.find_by_credentials(session[:session_token])
	end

	def current_user=(user)
		@current_user = user
		session[:session_token] = user.session_token
	end

	def logout_current_user!
		current_user.reset_session_token!
		session[:session_token] = nil
	end

	def require_current_user!
		render json: { error: "Must be logged in." }, status: 401
	end

	def require_no_current_user!
		render json: { error: "Must not be logged in." }, status: 403
	end
end
