class CommentsController < ApplicationController
  # before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  # def index
  #   @comments = Comment.all
  # end

  # GET /comments/1
  # GET /comments/1.json
  def show
    redirect_to post_path(@comment.post_id)
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  # def edit
  # end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    puts "########### not yet saved"
    respond_to do |format|
      if @comment.save
        puts "########### saved"
        # NewCommentMailer.email_owner(@comment.post_id).deliver_now
        # message = NewCommentMailer.email_owner(@comment.post_id)
        # # message['X-SES-FROM-ARN'] = 'arn:aws:ses:us-east-1:012345678910:identity/mohammed@memes.com'
        # message.deliver

        NewCommentNotificationJob.perform_now(@comment.post.id)

        format.html { redirect_to post_path(@comment.post_id), notice: 'Comment was successfully created.' }
        puts "########### redirected"
        # format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to post_path(params[:post_id]) }
        # format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  # def update
  #   respond_to do |format|
  #     if @comment.update(comment_params)
  #       format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @comment }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @comment.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /comments/1
  # DELETE /comments/1.json
  # def destroy
  #   @comment.destroy
  #   respond_to do |format|
  #     format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_comment
    #   @comment = Comment.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:post_id, :text)
    end
end
