class LessonsController < ApplicationController
    before_action :require_login
    before_action :find_lesson, only: [:show, :edit, :update, :destroy]
    before_action :require_expert, only: [:new, :create, :edit, :update, :destroy]

    def new  
        if @user.skills.empty?
            redirect_to '/skills/new'
        else
            @lesson = Lesson.new
        end
    end

    def create
        @lesson = Lesson.new(lesson_params)
        unless @lesson.save
            flash[:errors] = @lesson.errors.full_messages
            redirect_to new_lesson_path
        else
            redirect_to lesson_path(@lesson)
        end
    end

    def edit
    end

    def update
        if @lesson.update(lesson_params)
            redirect_to lesson_path(@lesson)
        else 
            flash[:errors] = @lesson.errors.full_messages
            redirect_to edit_lesson_path(@lesson)
        end 
    end

    def show
        @progress = Progress.find_by(lesson_id: @lesson.id, student_id: current_user.id)
    end

    def index
        @lessons = Lesson.all
    end

    private

    def find_lesson
        @lesson = Lesson.find(params[:id])
    end

    def require_expert
        return redirect_to '/restricted' unless @user.expert?
    end

    def lesson_params
        params.require(:lesson).permit(
            :name,
            :description,
            :skill_id,
            :lesson_video
        )
    end

end
