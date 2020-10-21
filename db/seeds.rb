User.destroy_all
Category.destroy_all
Lesson.destroy_all
Progress.destroy_all
Skill.destroy_all

#create users
25.times do
    User.create(name: Faker::Name.unique.name, username: Faker::Internet.username, password: "pass123", email: Faker::Internet.email, expert?: false)
end

#create experts
5.times do
    User.create(name: Faker::Name.unique.name, username: Faker::Internet.username, password: "pass123", email: Faker::Internet.email, expert?: true)    
end

#create categories
5.times do
    Category.create(name: Faker::Educator.subject)
end

#create skills
10.times do
    Skill.create(
        name: Faker::Educator.course_name,
        difficult_level: %w(novice intermediate advanced).sample,
        category: Category.all.sample
        )
end

#create lessons
25.times do
    temp = Skill.all.sample
    Lesson.create(
        name: temp.name + " " + Faker::Lorem.word,
        description: Faker::Lorem.paragraphs(number: 1),
        expert: User.where(expert?: true).sample,
        skill: temp
        )
end