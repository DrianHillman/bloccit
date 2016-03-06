require 'random_data'

Post.find_or_create_by(title: "Drian's Title", body: "Body of the post.")
# Used the following in the Rails Console to test uniqueness after multiple seeds:
# Post.find_by(title: "Drian's Title", body: "Body of the post.")
Comment.find_or_create_by(body: "Drian's Unique Comment")


# Create Posts
50.times do
  Post.create!(
    title:   RandomData.random_sentence,
    body:    RandomData.random_paragraph
  )
end
posts = Post.all

# Create Comments
100.times do
  Comment.create!(

  post: posts.sample,
  body: RandomData.random_paragraph
  )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
