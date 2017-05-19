10.times do
  User.create(email: Faker::Internet.email, password: "password")
end

User.all.each do |user|
  3.times do
    title = Faker::Hacker.adjective + " " + Faker::Hacker.noun
    user.created_questions << Question.create(title: title, body: Faker::Lorem.paragraph)
  end
  3.times do
    answer = Answer.new(body: Faker::Hacker.say_something_smart, user_id: user.id, question_id: rand(1..30))
    answer.save!
  end
end
