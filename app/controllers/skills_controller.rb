class SkillsController < ApplicationController
    before_action :require_login


    def show
        @skill = Skill.all.find(params[:id])
    end

    private

    def skill_params
        params.require(:skill).permit(
            :name,
            :difficult_level,
            :category_id,
            :skill_thumbnail
        )
    end
end
