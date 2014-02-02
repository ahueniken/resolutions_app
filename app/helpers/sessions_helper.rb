module SessionsHelper
	def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.where(remember_token: remember_token).first
  end

  def sign_out
    current_user = nil
    cookies.delete(:remember_token)
  end

  def signed_in_user  
    redirect_to signin_path, notice: "Please sign in." unless signed_in?   
  end 

  def get_first_name(full_name)
    full_name.Split()[0]
  end

end
