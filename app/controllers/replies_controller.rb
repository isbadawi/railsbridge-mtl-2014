class RepliesController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @reply = Reply.new
  end

  def create
    @post = Post.find(params[:post_id])
    @reply = Reply.create(reply_params.merge(user: current_user, post: @post))
    if @reply.valid?
      redirect_to post_path(@post)
    else
      flash.now[:alert] = @reply.errors.full_messages.join('<br/>')
      render template: 'posts/show'
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:content)
  end
end
