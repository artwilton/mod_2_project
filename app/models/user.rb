class User < ApplicationRecord

    has_many :curricula, :class_name => "Lesson", :foreign_key => 'expert_id'
    has_many :skills, :foreign_key => 'guest_id'

    has_many :progresses, :foreign_key => 'student_id'
    has_many :lessons, through: :progresses

    has_secure_password
    validates_uniqueness_of :username

    #macros / associations for payment API
    monetize :price_cents
    has_many :transactions_received, class_name: "Transaction", foreign_key: :expert_id, dependent: :destroy
    has_many :subscribers, through: :transactions_received, source: :expert
    has_many :transactions_sent, class_name: "Transaction", foreign_key: :student_id, dependent: :destroy
    has_many :subscriptions, through: :transactions_sent, source: :student
end