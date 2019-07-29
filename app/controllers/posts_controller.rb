class PostsController < ApplicationController # same name as file, inherits from application controller
    def index #empty function call for index page
        @posts = Post.all
    end
    
    def new #function call to create new post
        @post = Post.new # instance variable using post new, post being post.rb in the models folder
    end
    
    def create #create function to create new post (think CRUD)
        @post = Post.create(post_params) # instance variable makes post create given an image and caption
        redirect_to posts_path # after go back to post page
    end
    
    private
        def post_params
            params.require(:post).permit(:image, :caption)
        end
end