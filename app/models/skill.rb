class Skill < ApplicationRecord

    belongs_to :category
    has_many :lessons

end
