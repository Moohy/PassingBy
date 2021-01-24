class LikesController < ApplicationController
  def like
    @like = Like.new()
    @like.post_id = params[:post_id]
    @like.user_id = current_user.id

    respond_to do |format|
      if @like.save
        format.html { redirect_to @like.post, notice: 'Like was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to  post_path(params[:post_id]) }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  def unlike
    post = Post.find_by_id( params[:post_id])
    if post && current_user && (post.user == current_user)
      @like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
      unless @like
        redirect_to post_path(params[:post_id]) 
        return
      end
      @like.destroy
      respond_to do |format|
        format.html { redirect_to post_path(params[:post_id]), notice: 'Like was successfully removed.' }
        format.json { render :show, status: :created, location: @comment }
      end
    else
      redirect_to post_path(params[:post_id])
    end
  end
end
