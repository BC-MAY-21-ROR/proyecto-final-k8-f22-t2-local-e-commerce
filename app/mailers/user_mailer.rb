class UserMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers
  default from: 'donotreply@local-ecommerce.com'
  default template_path: 'users/mailer'

  def reset_password_instructions(user, _token = 'token', _opts = {})
    create_reset_password_token(user)
    mail(to: user.email, subject: 'Reestablecer contraseña')
  end

  private
  def create_reset_password_token(user)
    raw, hashed = Devise.token_generator.generate(User, :reset_password_token)
    @token = raw
    user.reset_password_token = hashed
    user.reset_password_sent_at = Time.now.utc
    user.save
  end
end
