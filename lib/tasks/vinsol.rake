namespace :vinsol do
  desc "TODO"
  task create: :environment do
    print User.first
    us = User.create(name: $stdin.gets.chomp,
      email: $stdin.gets.chomp,
      password: $stdin.gets.chomp)
    print us
  end

end
