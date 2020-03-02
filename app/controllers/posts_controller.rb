class PostsController < ApplicationController
    before_action :post_find, only: [:edit, :update, :show]
   
    def new
        @post = Post.new
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def create
        @post = Post.create(post_params)
        redirect_to post_path(@post)
    end

    def edit
        @bloggers = Blogger.all
        @destinations = Destination.all
        @post.content = @post.content[1..-1]
    end

    def update
        if @post.likes > 0
            @post.increment!(:likes)
            redirect_to post_path
        else 
            params[:post][:likes] = params[:post][:likes].to_i
            @post.update(post_params) 
            redirect_to post_path
        end
    end
    
    def show
        @blogger = @post.blogger
        @destination = @post.destination
    end

    private

    def post_find
     @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :content, :blogger_id, :destination_id, :likes)
    end
end
