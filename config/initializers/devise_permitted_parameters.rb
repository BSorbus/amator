module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_filter :configure_permitted_parameters
  end

  protected

  # for Devise 3.5
  #  def configure_permitted_parameters
  #    devise_parameter_sanitizer.for(:sign_up) << :name
  #    devise_parameter_sanitizer.for(:account_update) << :name
  #  end

  # for Devise 4.2.0
  def configure_permitted_parameters
    # added_attrs = [:name, :email, :password, :password_confirmation]
    # devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    # devise_parameter_sanitizer.permit :account_update, keys: added_attrs

    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:name, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:sign_in) do |user|
      user.permit(:name, :password)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user|
      user.permit(:name, :email, :current_password, :password, :password_confirmation)
    end

  end

end

DeviseController.send :include, DevisePermittedParameters
