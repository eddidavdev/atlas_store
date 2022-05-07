class ApplicationController < ActionController::Base

    def index:
        @banners = Banner.all
    end

end
