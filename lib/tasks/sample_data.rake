require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    
    admin = User.create!( :name => "Uri Gorelik",
                          :email => "uri.gore@gmail.com",
                          :password => "admin1",
                          :password_confirmation => "admin1")
    admin.toggle!(:admin)
    
    User.create!(:name => "Example User",
                 :email => "example@railstutorial.org",
                 :password => "foobar",
                 :password_confirmation => "foobar")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
  end
end