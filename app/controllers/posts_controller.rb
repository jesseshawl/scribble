class PostsController < ApplicationController

  #index
  def index
   @posts = Post.all
   # can you think of a way to show posts by the logged in user
  end

  #new
  def new
    @post = Post.new
  end

  #create - is the button we're hitting when we make new post - this is what is actually "creating" it
  def create
    @post = Post.create!(post_params)
    redirect_to posts_url, notice: "#{@post.title} was successfully saved as a post."
    # :+1:
  end

  #def show
  def show
    @post = Post.find(params[:id])
  end

  # edit
  def edit
    @post = Post.find(params[:id])
  end

  #update
  def update
    @post = Post.find(params[:id])
    # ^^ could use a before_action to set this instance variable
    @post.update(post_params)

    redirect_to post_path(@post)
  end

  #destroy
  def destroy
    @post = Post.find(params[:id])
    # can you think of a way to only let users who created the post destroy it?
    @post.destroy

    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :photo_url)
  end


end
