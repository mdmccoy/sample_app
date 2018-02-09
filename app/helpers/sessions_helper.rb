module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if @current_user.nil?
      @current_user = User.find_by(id: settings[:user_id])
    else
      @current_user
    end
  end
end
