class Lesson < ApplicationRecord

    has_many :progresses
    belongs_to :skill
    has_one :expert, through: :skill
    has_one_attached :lesson_video

    # validates :name, :description, :skill, presence: true
    validate :lesson_video_format
    validates_uniqueness_of :name


    private

    def lesson_video_format
        if lesson_video.attached? && !lesson_video.content_type.in?(%w(video/mp4))
            errors.add(:lesson_video, 'must be an mp4.')
        elsif lesson_video.attached? == false
            errors.add(:lesson, 'must include a video file.')
        end
    end
end