class ApplicationController < ActionController::Base
  include Clearance::Controller
     protect_from_forgery with: :exception

     include SessionsHelper

     helper_method :current_user

     def current_user
         @current_user ||= User.find_by(id: session[:user_id])
     end


     private
     def require_logged_in_user
         unless user_signed_in?
            flash[:danger] = 'Área restrita. Por favor, realize o login.'
            redirect_to entrar_path
         end
      end
end
