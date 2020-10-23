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
User.create(name: "Tony Hawk", username: "birdman", password: "pass123", email: "tony@hawk.com", expert?: true)
User.create(name: "Nahre Sol", username: "nahre.sol", password: "pass123", email: "nahre@sol.com", expert?: true)
User.create(name: "Robert J. Lang", username: "robert.lang", password: "pass123", email: "robert@lang.com", expert?: true)
# 5.times do
#     # User.create(name: Faker::Name.unique.name, username: Faker::Internet.username, password: "pass123", email: Faker::Internet.email, expert?: true)    
# end

#create categories
Category.create(name: "Sports")
Category.create(name: "Music")
Category.create(name: "Art")
# 5.times do
#     Category.create(name: Faker::Educator.subject)
# end

def default_profile_pic
    self.profile_picture.attach(io: File.open('default_content/76BB43A5-9794-473B-A51F-14F31BD7FCDC_4_5005_c.jpeg'), filename: 'default_profile_pic.jpeg') unless self.profile_picture.attached?
end

#create skills
skill = Skill.new(name: "Skateboarding - Novice", difficult_level: "novice", category: Category.all.find_by(name: "Sports"), expert: User.find_by(name: "Tony Hawk"))
skill.skill_thumbnail.attach(io: File.open('app/assets/images/carousel/skate.jpg'), filename: 'skate.jpg')
skill.save

skill = Skill.new(name: "Skateboarding - Intermediate", difficult_level: "intermediate", category: Category.all.find_by(name: "Sports"), expert: User.find_by(name: "Tony Hawk"))
skill.skill_thumbnail.attach(io: File.open('app/assets/images/carousel/skate.jpg'), filename: 'skate.jpg')
skill.save

skill = Skill.new(name: "Skateboarding - Advanced", difficult_level: "advanced", category: Category.all.find_by(name: "Sports"), expert: User.find_by(name: "Tony Hawk"))
skill.skill_thumbnail.attach(io: File.open('app/assets/images/carousel/skate.jpg'), filename: 'skate.jpg')
skill.save

skill = Skill.new(name: "Piano - Novice", difficult_level: "novice", category: Category.all.find_by(name: "Music"), expert: User.find_by(name: "Nahre Sol"))
skill.skill_thumbnail.attach(io: File.open('app/assets/images/carousel/piano.jpg'), filename: 'piano.jpg')
skill.save

skill = Skill.new(name: "Piano - Intermediate", difficult_level: "intermediate", category: Category.all.find_by(name: "Music"), expert: User.find_by(name: "Nahre Sol"))
skill.skill_thumbnail.attach(io: File.open('app/assets/images/carousel/piano.jpg'), filename: 'piano.jpg')
skill.save

skill = Skill.new(name: "Piano - Advanced", difficult_level: "advanced", category: Category.all.find_by(name: "Music"), expert: User.find_by(name: "Nahre Sol"))
skill.skill_thumbnail.attach(io: File.open('app/assets/images/carousel/piano.jpg'), filename: 'piano.jpg')
skill.save

skill = Skill.new(name: "Origami - Novice", difficult_level: "novice", category: Category.all.find_by(name: "Art"), expert: User.find_by(name: "Robert J. Lang"))
skill.skill_thumbnail.attach(io: File.open('app/assets/images/carousel/origami.jpg'), filename: 'origami.jpg')
skill.save

skill = Skill.new(name: "Origami - Intermediate", difficult_level: "intermediate", category: Category.all.find_by(name: "Art"), expert: User.find_by(name: "Robert J. Lang"))
skill.skill_thumbnail.attach(io: File.open('app/assets/images/carousel/origami.jpg'), filename: 'origami.jpg')
skill.save

skill = Skill.new(name: "Origami - Advanced", difficult_level: "advanced", category: Category.all.find_by(name: "Art"), expert: User.find_by(name: "Robert J. Lang"))
skill.skill_thumbnail.attach(io: File.open('app/assets/images/carousel/origami.jpg'), filename: 'origami.jpg')
skill.save

# 10.times do
#     Skill.create(
#         name: Faker::Educator.course_name,
#         difficult_level: %w(novice intermediate advanced).sample,
#         category: Category.all.sample
#         )
# end

#create lessons

Lesson.create(name: "1. Skating Lesson", description: "Tony Hawk teaches skateboarding.", skill: Skill.find_by(name: "Skateboarding - Novice"))
Lesson.create(name: "2. Skating Lesson", description: "Tony Hawk teaches skateboarding.", skill: Skill.find_by(name: "Skateboarding - Novice"))
Lesson.create(name: "3. Skating Lesson", description: "Tony Hawk teaches skateboarding.", skill: Skill.find_by(name: "Skateboarding - Novice"))
Lesson.create(name: "4. Skating Lesson", description: "Tony Hawk teaches skateboarding.", skill: Skill.find_by(name: "Skateboarding - Intermediate"))
Lesson.create(name: "5. Skating Lesson", description: "Tony Hawk teaches skateboarding.", skill: Skill.find_by(name: "Skateboarding - Intermediate"))
Lesson.create(name: "6. Skating Lesson", description: "Tony Hawk teaches skateboarding.", skill: Skill.find_by(name: "Skateboarding - Intermediate"))
Lesson.create(name: "7. Skating Lesson", description: "Tony Hawk teaches skateboarding.", skill: Skill.find_by(name: "Skateboarding - Advanced"))
Lesson.create(name: "8. Skating Lesson", description: "Tony Hawk teaches skateboarding.", skill: Skill.find_by(name: "Skateboarding - Advanced"))
Lesson.create(name: "9. Skating Lesson", description: "Tony Hawk teaches skateboarding.", skill: Skill.find_by(name: "Skateboarding - Advanced"))

Lesson.create(name: "1. Intro to Composition", description: "Nahre Sol teaches piano.", skill: Skill.find_by(name: "Piano - Novice"))
Lesson.create(name: "2. Composition Lesson", description: "Nahre Sol teaches piano.", skill: Skill.find_by(name: "Piano - Novice"))
Lesson.create(name: "3. Composition Lesson", description: "Nahre Sol teaches piano.", skill: Skill.find_by(name: "Piano - Novice"))
Lesson.create(name: "4. Composition Lesson", description: "Nahre Sol teaches piano.", skill: Skill.find_by(name: "Piano - Intermediate"))
Lesson.create(name: "5. Composition Lesson", description: "Nahre Sol teaches piano.", skill: Skill.find_by(name: "Piano - Intermediate"))
Lesson.create(name: "6. Composition Lesson", description: "Nahre Sol teaches piano.", skill: Skill.find_by(name: "Piano - Intermediate"))
Lesson.create(name: "7. Composition Lesson", description: "Nahre Sol teaches piano.", skill: Skill.find_by(name: "Piano - Advanced"))
Lesson.create(name: "8. Composition Lesson", description: "Nahre Sol teaches piano.", skill: Skill.find_by(name: "Piano - Advanced"))
Lesson.create(name: "9. Composition Lesson", description: "Nahre Sol teaches piano.", skill: Skill.find_by(name: "Piano - Advanced"))

Lesson.create(name: "1. Intro to Origami", description: "Robert J. Lang teaches origami.", skill: Skill.find_by(name: "Origami - Novice"))
Lesson.create(name: "2. Origami Lesson", description: "Robert J. Lang teaches origami.", skill: Skill.find_by(name: "Origami - Novice"))
Lesson.create(name: "3. Origami Lesson", description: "Robert J. Lang teaches origami.", skill: Skill.find_by(name: "Origami - Novice"))
Lesson.create(name: "4. Origami Lesson", description: "Robert J. Lang teaches origami.", skill: Skill.find_by(name: "Origami - Intermediate"))
Lesson.create(name: "5. Origami Lesson", description: "Robert J. Lang teaches origami.", skill: Skill.find_by(name: "Origami - Intermediate"))
Lesson.create(name: "6. Origami Lesson", description: "Robert J. Lang teaches origami.", skill: Skill.find_by(name: "Origami - Intermediate"))
Lesson.create(name: "7. Origami Lesson", description: "Robert J. Lang teaches origami.", skill: Skill.find_by(name: "Origami - Advanced"))
Lesson.create(name: "8. Origami Lesson", description: "Robert J. Lang teaches origami.", skill: Skill.find_by(name: "Origami - Advanced"))
Lesson.create(name: "9. Origami Lesson", description: "Robert J. Lang teaches origami.", skill: Skill.find_by(name: "Origami - Advanced"))
