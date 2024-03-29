class User::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
    permit(:sign_in, keys: [:email, :password])
  end
end