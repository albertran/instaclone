class PostsController < ApplicationController # same name as file, inherits from application controller
    before_action :authenticate_user! # check if a user is logged in
    before_action :set_post, only: [:show, :edit, :update, :destroy, :like]
    before_action :owned_post, only: [:edit, :update, :destroy]


    def index #empty function call for index page
        @posts = Post.all.order('created_at DESC').page params[:page] #this saves all posts into the instance variable
    end
    
    def new #function call to create new post
        @post = current_user.posts.build # instance variable using post new, post being post.rb in the models folder
    end
    
    def create #create function to create new post (think CRUD)
        @post = current_user.posts.build(post_params)
        
        if @post.save # if post is successfully created
            flash[:success] = "Your post has been created!"
            redirect_to posts_path # after go back to post page
        else
            flash.now[:alert] = "Your new post couldn't be created!  Please check the form."
            render :new #go back to new page
        end
    end
    
    def edit #edit function allows you to edit your post by first grabbing the post you wanted to edit by id
    end
    
    def update
        if @post.update(post_params) #if post is successfully updated
            flash[:success] = "Post updated."
            redirect_to posts_path #go back to post to see changes made
        else
            flash.now[:alert] = "Update failed.  Please check the form."
            render :edit #go back to edit page
        end
    end
    
    def show #show function to view a particular post (think read from CRUD)
    end
    
    def destroy #destroy function deletes a post
        if @post.destroy #call destroy on the post
            flash[:success] = "Post deleted."
            redirect_to root_path #go back to the root index
        else
            flash[:alert] = "Could not delete, your post is on here forever.."
            redirect_to root_path
        end
    end
    
    def like
        if @post.liked_by current_user
            respond_to do |format|
                format.html { redirect_to :back }
                format.js
            end
        end
    end
    
    private
        def post_params #private function to require parameters for posts
            params.require(:post).permit(:image, :caption)
        end
        
        def set_post
            @post = Post.find(params[:id])
        end
        
        def owned_post # redirect user to home page if they try to edit a post of another user
            unless current_user == @post.user
            flash[:alert] = "That post doesn't belong to you!"
            redirect_to root_path
        end
end
end

#create
#read
#update
#delete