class LessonsController < ApplicationController
    before_action :require_login, :find_lesson, only: [:show, :edit, :update, :destroy]

    def new
        @lesson = Lesson.new
    end

    def create
        params[:expert_id] = @user.id
        lesson = Lesson.create(lesson_params)
        unless lesson.valid?
            flash[:errors] = lesson.errors.full_messages
            redirect_to new_lesson_path
        else
            redirect_to lesson_path(lesson)
        end
    end

    def edit
    end

    def update
        if @lesson.update(lesson_params)
            redirect_to lesson_path(@lesson)
        else 
            flash[:my_errors] = @lesson.errors.full_messages
            redirect_to edit_lesson_path(@lesson)
        end 
    end

    def show
        
    end

    def index
        @lessons = Lesson.all
    end

    private

    def find_lesson
        @lesson = Lesson.find(params[:id])
    end

    def lesson_params(*args)
        params.require(:lesson).permit(
            :expert_id,
            :name,
            :description,
            :skill_id,
            :lesson_video
        )
    end
end
