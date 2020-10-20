# User.destroy_all
# Category.destroy_all
# Lesson.destroy_all
# Progress.destroy_all
# Skill.destroy_all

#create users
25.times do
    User.create(name: Faker::Name.unique.name, username: Faker::Internet.username, password: Faker::Internet.password, email: Faker::Internet.email, expert?: false)
end

#create experts
5.times do
    User.create(name: Faker::Name.unique.name, username: Faker::Internet.username, password: Faker::Internet.password, email: Faker::Internet.email, expert?: true)    
end

#create categories
5.times do
    Category.create(name: Faker::Educator.course_name)
end

#create lessons
25.times do
    Lesson.create(name: Faker::Educator.subject, description: Faker::Lorem.paragraphs(number: 1))
end

