class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  # private
  # # Overwriting the sign_out redirect path method
  # def after_sign_out_path_for(resource_or_scope)
  #   root_path
  # end
  #
  # private

  def authenticate!
    :authenticate_dosen || :authenticate_mahasiswa!
    @current_user = user_signed_in? ? current_dosen: current_mahasiswa
  end

  # protected
  # def authenticate_user!
  #   if user_signed_in?
  #     super
  #   else
  #     redirect_to login_path, notice: "Please Login to view that page!"
  #   end
  # end
end
