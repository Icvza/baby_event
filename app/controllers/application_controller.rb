class ApplicationController < ActionController::Base
    include ApplicationHelper

    def welcome 
        if logged_in?
            redirect_to user_path(current_user.id)
        else
            render 'welcome'
        end
    end 
end
