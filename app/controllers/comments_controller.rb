class CommentsController < ApplicationController
    before_action :set_post #set the corresponding post for this comment

    def index
        @comments = @post.comments.order("created_at ASC")
        respond_to do |format|
            format.html { render layout: !request.xhr? }
        end
    end
    
    def create
        @comment = @post.comments.build(comment_params)
        @comment.user_id = current_user.id #save the user that posted that comment

        if @comment.save
            respond_to do |format|
                format.html { redirect_to root_path }
                format.js
            end
        else
            flash[:alert] = "Check the comment form, something went horribly wrong."
            render root_path
        end
    end
    
    def destroy #destroy function deletes a post
        @comment = @post.comments.find(params[:id])
        if @comment.user_id == current_user.id
            @comment.delete
            respond_to do |format|
                format.html { redirect_to root_path }
                format.js
            end
        else
            flash[:alert] = "Could not delete, your comment is on here forever.."
            redirect_to root_path
        end
    end
    
    private
    
        def comment_params
          params.require(:comment).permit(:content)
        end
        
        def set_post
          @post = Post.find(params[:post_id])
        end
end