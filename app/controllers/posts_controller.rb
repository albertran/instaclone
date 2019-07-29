class PostsController < ApplicationController # same name as file, inherits from application controller
    def index #empty function call for index page
        @posts = Post.all #this saves all posts into the instance variable
    end
    
    def new #function call to create new post
        @post = Post.new # instance variable using post new, post being post.rb in the models folder
    end
    
    def create #create function to create new post (think CRUD)
        @post = Post.create(post_params) # instance variable makes post create given an image and caption
        redirect_to posts_path # after go back to post page
    end
    
    def edit #edit function allows you to edit your post by first grabbing the post you wanted to edit by id
        @post = Post.find(params[:id])
    end
    
    def update
        @post = Post.find(params[:id]) #get the post
        @post.update(post_params) #call update on the post given parameters
        redirect_to(post_path(@post)) #go back to post to see changes made
    
    end
    
    def show #show function to view a particular post (think read from CRUD)
        @post = Post.find(params[:id]) 
    end
    
    private
        def post_params #private function to require parameters for posts
            params.require(:post).permit(:image, :caption)
        end
end

#create
#read
#update
#delete