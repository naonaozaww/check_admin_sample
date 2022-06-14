10.times do |i|
  User.create(
    first_name: "first_name#{i}",
    last_name: "last_name#{i}",
    email: "user#{i}@example.com",
    password: "password",
    password_confirmation: "password"
  )
end

20.times do |i|
  Post.create(
    title: "title#{i}",
    content: "content#{i}",
    user: User.offset(rand(User.count)).first
  )
end
