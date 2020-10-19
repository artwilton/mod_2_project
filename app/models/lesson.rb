class Lesson < ApplicationRecord

    has_many :progresses
    belongs_to :skill

end
