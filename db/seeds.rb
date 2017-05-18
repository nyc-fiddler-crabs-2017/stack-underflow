10.times do
  User.create(email: Faker::Internet.email, password: "password")
end

User.all.each do |user|
  3.times do
    user.created_questions << Question.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph)
  end
  3.times do
    answer = Answer.new(body: Faker::Lorem.paragraph, user_id: user.id, question_id: rand(1..30))
    answer.save!
  end
end
