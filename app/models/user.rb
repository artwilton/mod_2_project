class User < ApplicationRecord

    has_many :curricula, :class_name => "Lesson", :foreign_key => 'expert_id'
    has_many :skills, :foreign_key => 'expert_id'

    has_many :progresses, :foreign_key => 'student_id'
    has_many :lessons, through: :progresses

    has_secure_password
    validates_uniqueness_of :username

    #active storage association
    has_one_attached :profile_picture
    validate :default_profile_pic, :on => :create

    #macros / associations for payment API
    monetize :price_cents
    has_many :transactions_received, class_name: "Transaction", foreign_key: :expert_id, dependent: :destroy
    has_many :subscribers, through: :transactions_received, source: :expert
    has_many :transactions_sent, class_name: "Transaction", foreign_key: :student_id, dependent: :destroy
    has_many :subscriptions, through: :transactions_sent, source: :student

    private

    def default_profile_pic
        self.profile_picture.attach(
            io: File.open('default_content/76BB43A5-9794-473B-A51F-14F31BD7FCDC_4_5005_c.jpeg'),
            filename: 'default_profile_pic.jpeg') unless self.profile_picture.attached?
    end
end
