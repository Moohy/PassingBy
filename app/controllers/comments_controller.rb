class CommentsController < ApplicationController
  # before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments/1
  # GET /comments/1.json
  def show
    redirect_to post_path(@comment.post_id)
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end


  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        NewCommentNotificationJob.perform_now(@comment.post.id)

        format.html { redirect_to post_path(@comment.post_id), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to post_path(params[:post_id]) }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def new_posts_mailer
    NewPostsMailer.email_users("users").deliver_now
  end

  private

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:post_id, :text)
    end
end
