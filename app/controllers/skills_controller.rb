class SkillsController < ApplicationController
    before_action :require_login
    before_action :find_skill, only: [:show, :edit, :update, :destroy]
    before_action :require_expert, only: [:new, :create, :edit, :update, :destroy]

    def index
        @skills = Skill.all
    end

    def show
    end

    def new
        @skill = Skill.new
    end

    def edit  
    end

    def create
        @skill = Skill.new(skill_params)
        unless @skill.save
            flash[:errors] = @skill.errors.full_messages
            redirect_to new_skill_path
        else
            redirect_to skill_path(@skill)
        end
    end

    def update
        if @skill.update(skill_params)
            redirect_to skill_path(@skill)
        else 
            flash[:errors] = @skill.errors.full_messages
            redirect_to edit_skill_path(@skill)
        end 
    end

    private

    def find_skill
        @skill = Skill.find(params[:id])
    end

    def require_expert
        return redirect_to '/restricted' unless @user.expert?
    end

    def skill_params
        params.require(:skill).permit(
            :name,
            :difficult_level,
            :expert_id,
            :category_id
        )
    end
end
