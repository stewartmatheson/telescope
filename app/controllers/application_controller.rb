class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
  private 
  def redirect_if_not_logged
    if !user_signed_in?
      redirect_to new_user_session_path, :notice => "You must be logged in to perform this action."
    end
  end
end
