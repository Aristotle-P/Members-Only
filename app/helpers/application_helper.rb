module ApplicationHelper

  def log_in(user)
    cookies.permanent[:remember_digest] = user.remember_digest
  end

  def current_user
    if cookies[:remember_digest]
      @current_user ||= User.find_by(remember_digest: cookies[:remember_digest])
    else
      return nil
    end
  end

  def current_user=(user)
    log_in(user)
  end

  def sign_out
    cookies.delete(:remember_digest)
  end

  def logged_in?
    !current_user.nil?
  end
  
  def logged_in
    unless logged_in?
      flash[:danger] = "You must be logged in to view"
      redirect_to login_path
    end
  end

  def list_user(id)
    user = User.find(id)
    return user.email
  end
end
