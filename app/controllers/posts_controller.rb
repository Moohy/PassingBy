class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create]
  DEFAULT_CITY=ENV['DEFAULT_CITY'] || "Jeddah"

  # GET /posts
  # GET /posts.json
  def index
    @city = request.location.city || DEFAULT_CITY
    @posts = Post.near_by_posts(@city)
    @other_posts = Post.where.not(city: @city).sample(10)
    # @posts = @posts.map {|post| {post: post, comments: post.comments}}
    # puts @posts
  end

  # GET /posts/1
  # GET /posts/1.json
  def show 
    @comment = Comment.new
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # POST /posts
  # POST /posts.json
  def create
    return unless !!current_user
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.city = user_city 
    @post.image.attach(params[:post][:image])

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_path @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    return if @post.user != current_user
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def user
    if !!current_user
      @posts = current_user.posts
      respond_to do |format|
        format.html { render 'user_posts' }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'Not allowed' }
      end
    end
  end

  def new_posts_mailer
    NewPostsMailer.email_users("users").deliver_now
    render json: {data: "emails sent"}, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:image)#image
    end

    def user_city
      request.location.city || DEFAULT_CITY
    end

    def user_lon
      request.location.coordinates[1]
    end

    def user_lat
      request.location.coordinates[0]
    end
end
