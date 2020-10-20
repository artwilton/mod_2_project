class Lesson < ApplicationRecord

    has_many :progresses
    belongs_to :skill
    belongs_to :expert, :class_name => "User"

end
