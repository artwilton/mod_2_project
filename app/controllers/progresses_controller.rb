class ProgressesController < ApplicationController
    before_action :require_login

    def create
        @progress = Progress.new(progress_params)
        unless @progress.save
            flash[:errors] = @progress.errors.full_messages
            redirect_to '/lessons'
        else
            redirect_to lesson_path(params[:progress][:lesson_id])
        end
    end

    def update
        @progress = Progress.find(params[:id])
        if @progress.update(progress_params)
            redirect_to lesson_path(params[:progress][:lesson_id])
        else 
            flash[:errors] = @progress.errors.full_messages
            redirect_to lesson_path(params[:progress][:lesson_id])
        end 
    end

    private

    def find_progress
        
    end

    def progress_params
        params.require(:progress).permit(
            :student_id,
            :lesson_id,
            :status
        )
    end
end
