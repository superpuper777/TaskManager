30.times do
  User.create!(
    name: Faker::Name.name_with_middle,
    email: Faker::Internet.free_email,
    password: Faker::Internet.password
  )
end
user_ids = User.ids

30.times do
  ApiKey.create!(
    user_id: user_ids.sample
  )
end

45.times do
  Project.create!(
    user_id: user_ids.sample,
    name: Faker::TvShows::BreakingBad.episode
  )
end
project_ids = Project.ids

85.times do
  Task.create!(
    project_id: project_ids.sample,
    name: Faker::Hacker.ingverb,
    status: Faker::Number.between(from: 1, to: 3),
    priority: Faker::Number.between(from: 1, to: 2)
  )
end
