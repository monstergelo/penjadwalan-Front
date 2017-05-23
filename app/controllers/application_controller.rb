class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception


  private
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path 
  end

  protected
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to login_path, notice: "Please Login to view that page!"
    end
  end
end
