class ApplicationController < ActionController::Base
    
    include ApplicationHelper 
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    private
    def redirect_if_not_logged_in?
        redirect_to '/' if !logged_in?
    end
    def record_not_found(error)
      
        @message = error.message
       
        redirect_to :root, notice: "Page Not Found: #{@message}"
    end

end
