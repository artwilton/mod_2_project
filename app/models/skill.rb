class Skill < ApplicationRecord

    belongs_to :category
    has_many :lessons

    has_one_attached :skill_thumbnail

end