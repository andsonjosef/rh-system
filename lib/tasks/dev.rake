namespace :dev do

  DEFAULT_PASSWORD = 123456

  desc "Configure the dev environment"
 task setup: :environment do
   if Rails.env.development?
     show_spinner("Deleting DB...") { %x(rails db:drop) }
     show_spinner("Creating DB...") { %x(rails db:create) }
     show_spinner("Migrating DB...") { %x(rails db:migrate) }
     show_spinner("Creating the default admin...") { %x(rails dev:add_default_admin) }
     show_spinner("Creating the default user....") { %x(rails dev:add_default_user) }
   else
     puts "You are not in the dev environment!"
   end
 end

  desc "Add the default admin"
 task add_default_admin: :environment do
   Admin.create!(
     email: 'admin@admin.com',
     password: DEFAULT_PASSWORD,
     password_confirmation: DEFAULT_PASSWORD
   )
 end

  desc "Add the default user"
 task add_default_user: :environment do
   User.create!(
     email: 'user@user.com',
     password: DEFAULT_PASSWORD,
     password_confirmation: DEFAULT_PASSWORD
   )
 end

  private

  def show_spinner(msg_start, msg_end = "Complete!")
   spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
   spinner.auto_spin
   yield
   spinner.success("(#{msg_end})")    
 end
end