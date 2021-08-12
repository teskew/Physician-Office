class ApplicationController < ActionController::Base
    def redirect_if_not_logged_in
        redirect_to '/' if !logged_in?
    end
end
