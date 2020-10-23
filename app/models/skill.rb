class Skill < ApplicationRecord

    belongs_to :category
    belongs_to :expert, :class_name => "User"
    has_many :lessons

end
