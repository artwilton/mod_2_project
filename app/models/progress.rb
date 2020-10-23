class Progress < ApplicationRecord

    belongs_to :student, :class_name => "User"
    belongs_to :lesson
    has_one :skill, through: :lesson
    has_one :expert, through: :skill

    validates_inclusion_of :status, in: %w(unwatched started complete)
    validate :expert_and_student_different#, message: "Expert and student cannot be the same"

    private

    def expert_and_student_different
        self.expert == self.student
    end
end
