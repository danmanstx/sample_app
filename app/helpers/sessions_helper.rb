module SessionsHelper
	def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end
  # test if a user exist
  def signed_in?
    !current_user.nil?
  end
  # used for current user declration
  def current_user=(user)
    @current_user = user
  end
  # ||= is and "or equals" uses value or if not exist takes the right side
  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end
   def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
end
