class ApplicationController < ActionController::Base
    def index
        puts request.location
        puts request.location.coordinates
        render json: request.location
    end
    
end
