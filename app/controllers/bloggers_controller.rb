class BloggersController < ApplicationController
    def index
        @bloggers = Blogger.all
        @best_likes = Blogger.most_likes
    end
   
    def show
        @blogger = Blogger.find(params[:id])
        @likes = @blogger.total_likes
        @top_five = @blogger.top_five_likes
    end

    def new
        @blogger = Blogger.new
        @error = flash[:error]
    end

    def create
        @blogger = Blogger.create(blogger_params)

        if @blogger.valid?
            redirect_to blogger_path(@blogger)
        else
            flash[:error] = @blogger.errors.full_messages
            redirect_to new_blogger_path
        end
    end

    private

    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end
end
