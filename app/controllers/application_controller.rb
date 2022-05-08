class ApplicationController < ActionController::Base
    before_action :set_banner

    private
        def set_banner
            @banners_count = Banner.where(active: true).count
            @rand_number = rand(100)
            if(@rand_number <= 10)
                get_banner(1)
            end
            if(@rand_number >= 11 && @rand_number <= 30)
                get_banner(2)
            end
            if(@rand_number >= 31 && @rand_number <= 60)
                get_banner(3)
            end
            if(@rand_number >= 61 && @rand_number <= 100)
                get_banner(4)
            end
        end

        def get_banner(int_freq)
            @banners = Banner.where(active: true, freq: int_freq)
            @count = @banners.count
            @rand = rand(@count)
            @banner = @banners[@rand]
        end
end
