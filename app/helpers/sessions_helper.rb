module SessionsHelper

    def sign_in(user)
        cookies.permanent[:remember_token] = user.remember_token
        self.current_user = user
        
        session[:user_id] = user.id
    end

    def sign_out
        session.delete(:user_id)
    end

    def current_user
        #@current_user ||= User.find_by(id: session[:user_id])
        @current_user ||= User.find_by_remember_token(cookies[:remember_token])
    end

    def user_signed_in?
        !current_user.nil?
    end

end
