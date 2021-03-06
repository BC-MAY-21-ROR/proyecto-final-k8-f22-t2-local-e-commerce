namespace :devise do
  desc "Send welcome reset password instructions to all users.
  This will lockout all users until they reset their password."
  task send_reset_password_instructions_to_all_users: :environment do
    User.where.not(email: nil).in_batches(of: 10).each_record do |user|
      # Send instructions so user can enter a new password:
      UserMailer.reset_password_instructions(user).deliver
      p user.id
    end
  end
end
