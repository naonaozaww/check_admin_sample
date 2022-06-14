class Admin::PostsController < Admin::BaseController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show; end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to admin_posts_path, success: 'Post was successfully updated.'
    else
      flash.now[:danger] = 'Failed to update Post'
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to admin_posts_path, success: 'Post was successfully destroyed.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
