100.times { Post.create(title: Faker::Lorem.words(rand(1..8)).join(' '), body: Faker::Lorem.paragraphs) }
10.times { User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, bio: Faker::Lorem.paragraph) }

users = User.all

Post.all.each do |post|
  post.update(user: users.sample)
  5.times { post.comments << Comment.new(body: Faker::Lorem.paragraph, user: users.sample) }
end