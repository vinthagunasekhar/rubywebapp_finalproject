# db/seeds.rb
unless User.exists?(email: 'dummy@example.com')
  User.create(email: 'dummy@example.com', password: 'password', password_confirmation: 'password')
end

unless User.exists?(email: 'sample@gmail.com')
  User.create(email: 'sample@gmail.com', password: 'Meta$100', password_confirmation: 'Meta$100')
end
