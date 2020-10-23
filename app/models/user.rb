class User < ApplicationRecord

    has_many :curricula, :class_name => "Lesson", :foreign_key => 'expert_id'
    has_many :skills, :foreign_key => 'expert_id'

    has_many :progresses, :foreign_key => 'student_id'
    has_many :lessons, through: :progresses

    has_secure_password
    validates_uniqueness_of :username
    validates_presence_of :name, :username, :email

    #active storage association
    has_one_attached :profile_picture
    validate :default_profile_pic, :on => :create

    #macros / associations for payment API
    has_many :transactions_received, class_name: "Transaction", foreign_key: :expert_id, dependent: :destroy
    has_many :subscribers, through: :transactions_received, source: :expert
    has_many :transactions_sent, class_name: "Transaction", foreign_key: :student_id, dependent: :destroy
    has_many :subscriptions, through: :transactions_sent, source: :student

    def lessons_in_progress
        self.progresses.filter{ |p| p.status == "started"}
    end

    def lessons_completed
        self.progresses.filter{ |p| p.status == "complete"}
    end

    def lesson_progresses_percent(skill)
        ct = skill.lessons.size
        prog = self.progresses.filter{ |p| p.skill== skill && p.status == "complete"}.size
        prog.to_f / ct
    end

    private

    def default_profile_pic
        self.profile_picture.attach(
            io: File.open('app/assets/images/default_profile_pic.jpeg'),
            filename: 'default_profile_pic.jpeg') unless self.profile_picture.attached?
    end
end