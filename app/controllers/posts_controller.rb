class PostsController < ApplicationController
  def create
    @post = Post.create(post_params.merge(user: current_user))
    if @post.valid?
      redirect_to post_path(@post)
    else
      flash.now[:alert] = @post.errors.full_messages.join('<br/>')
      render template: 'posts/new'
    end
  end

  def index
    @posts = Post.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @reply = Reply.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
