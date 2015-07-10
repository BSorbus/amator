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

#  def request_from_the_security_area?
#    # whitelist
#    @ips = ['127.0.0.1', '193.227.131.119']
#    @ips.include? request.remote_ip
#  end



  def request_from_the_security_area?
    #@ips = ['127.0.0.1', '192.168.1.0/24'] #And so on ...]
    @ips = ['127.0.0.1', '172.16.1.0/24'] #And so on ...]
    allowed = false
    # Convert remote IP (request.remote_ip is a string) to an integer.
    bremote_ip = request.remote_ip.split('.').map(&:to_i).pack('C*').unpack('N').first
    @ips.each do |ipstring|
      ip, mask = ipstring.split '/'
      # Convert tested IP to an integer.
      bip = ip.split('.').map(&:to_i).pack('C*').unpack('N').first
      # Convert mask to an integer, and assume /32 if not specified.
      mask = mask ? mask.to_i : 32
      bmask = ((1 << mask) - 1) << (32 - mask)
      if bip & bmask == bremote_ip & bmask
        allowed = true
        break
      end
    end

    return allowed
  end



end
