# MyMailer class overrides default Devise Mailer
class MyMailer < Devise::Mailer
  # helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views
  default from: Rails.application.secrets.email_provider_username
  default cc: Rails.application.secrets.email_provider_username

  # Overrides same inside Devise::Mailer
  def confirmation_instructions(record, token, opts={})
    @url = Rails.application.secrets.domain_name
    attachments.inline['logo_small.png'] = File.read('app/assets/images/logo_small.png')
    super
  end

  # Overrides same inside Devise::Mailer
  def reset_password_instructions(record, token, opts={})
    @url = Rails.application.secrets.domain_name
    attachments.inline['logo_small.png'] = File.read('app/assets/images/logo_small.png')
    super
  end

  # Overrides same inside Devise::Mailer
  def unlock_instructions(record, token, opts={})
    super
  end
end
