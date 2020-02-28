class DestinationsController < ApplicationController
    def show
        @destination = Destination.find(params[:id])
        @posts_five = @destination.most_recent_posts
        @most_likes = @destination.most_likes
        @average_age_bloggers = @destination.average_age
    end
end
