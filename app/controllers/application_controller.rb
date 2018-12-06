class ApplicationController < ActionController::Base
  before_action :setup_global_errors, :setup_user

  private
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def current_owner
    return unless session[:user_id]
    @current_owner ||= User.find(session[:user_id]).owner.id
  end

  def log_in!(user)
    session[:user_id] = user.id
  end

  def logged_in?
    !!session[:user_id]
  end

  def setup_global_errors
    @errors = flash[:errors]
  end

  def setup_user
    if session[:user_id]
      @logged_in_user = User.find(session[:user_id])
    end
  end

  def authenticate
    redirect_to new_session_path unless logged_in?
  end

end
