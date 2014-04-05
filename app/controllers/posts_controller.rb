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

  def edit
  end

  def index
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
