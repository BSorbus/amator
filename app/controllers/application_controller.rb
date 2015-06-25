class ApplicationController < ActionController::Base
	before_action :set_locale
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  before_action :restricted_area, if: :devise_controller?

  helper_method :request_from_the_security_area?


	def set_locale
	  I18n.locale = params[:locale] if params[:locale].present?
	end

  def default_url_options(options = {})
    {locale: I18n.locale}
  end

  def restricted_area
    unless request_from_the_security_area?
      flash[:error] = t "restricted_area"
      redirect_to(request.referrer || root_path)
    end
  end 

  def request_from_the_security_area?
    @ips = ['127.0.0.1', '193.227.131.119']
    @ips.include? request.remote_ip
  end

end
