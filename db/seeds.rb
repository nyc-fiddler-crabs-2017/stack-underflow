10.times do
  User.create(email: Faker::Internet.email, password: "password")
end

# User.all.each do |user|
#   3.times do
#     user.questions << Question.create(title: )
#   end
# end
