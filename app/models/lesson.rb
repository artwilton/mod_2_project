class Lesson < ApplicationRecord

    has_many :progresses
    belongs_to :skill
    has_one :expert, through: :skill
    has_one_attached :lesson_video

    # validates :name, :description, :skill, presence: true
    validate :lesson_video_format
    validates_uniqueness_of :name

    def duration
        
        if self.lesson_video.attached?
            t = self.lesson_video.blob.metadata.fetch(:duration, nil).to_i
            return Time.at(t).utc.strftime("%H:%M:%S")
        else
            return "No Video Attached"
        end
    end

    private

    def lesson_video_format
        if lesson_video.attached? && !lesson_video.content_type.in?(%w(video/mp4))
            errors.add(:lesson_video, 'must be an mp4.')
        elsif lesson_video.attached? == false
            errors.add(:lesson, 'must include a video file.')
        end
    end
end