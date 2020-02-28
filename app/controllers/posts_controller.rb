class PostsController < ApplicationController
    before_action :post_find, only: [:edit, :update, :show]
   
    def new
        @post = Post.new
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def create

    end

    def edit
        @bloggers = Blogger.all
        @destinations = Destination.all
        @post.content = @post.content[1..-1]
    end

    def update

    end

    def show
        @blogger = @post.blogger
        @destination = @post.destination
    end

    private

    def post_find
     @post = Post.find(params[:id])
    end

end
