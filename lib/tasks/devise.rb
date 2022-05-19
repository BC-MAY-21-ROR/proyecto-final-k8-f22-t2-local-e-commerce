task send_reset_password_instructions_to_all_users: :environment do
  User.take(100).in_batches(of: 10).each_record do |user|
      # Send instructions so user can enter a new password:
      UserMailer.reset_password_instructions(user).deliver
      p user.id
    end
 end
