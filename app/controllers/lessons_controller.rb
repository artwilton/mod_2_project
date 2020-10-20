class LessonsController < ApplicationController
    before_action :require_login

    belongs_to :expert, :class_name => "User"
end
