class ApplicationController < ActionController::Base
    def index
        render json: request.location
    end
    
end
