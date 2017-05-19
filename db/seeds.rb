10.times do
  User.create(email: Faker::Internet.email, password: "password")
end

User.all.each do |user|
  3.times do
    title = Faker::Hacker.adjective + " " + Faker::Hacker.noun
    question = Question.create(title: title, body: Faker::Lorem.paragraph)
    user.created_questions << question
  end
  3.times do
    answer = Answer.new(body: Faker::Hacker.say_something_smart, user_id: user.id, question_id: rand(1..30))
    answer.save!
  end


end

Question.all.each do |question|
  question.comments.create(user_id: rand(1..User.all.length), body: Faker::Hacker.say_something_smart)
end

Answer.all.each do |answer|
  answer.comments.create(user_id: rand(1..User.all.length), body: Faker::Hacker.say_something_smart)
end
