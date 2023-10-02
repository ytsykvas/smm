class PostsController < ApplicationController
  before_action :set_active_storage_host, only: %i[index show]
  before_action :find_post, only: %i[show destroy]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @allowed_users = %w[admin manager employee]
    find_post
  end

  def new
    @post = Post.new
  end

  def create
    create_post = Post::CreatePost.new(params: params, user: current_user)
    if create_post.perform
      redirect_to posts_path, notice: t('posts.post_is_created')
    else
      @post = create_post.post
      flash.now[:alert] = "#{t('posts.error_when_creating_post')} #{create_post.instance_variable_get(:@error_message)}"
      render :new
    end
  end

  def edit
    find_post
  end

  def update
    if find_post.update(post_params)
      redirect_to post_path(@find_post), notice: t('posts.post_is_updated')
    else
      render :edit, notice: t('posts.check_your_data')
    end
  end

  def destroy
    find_post.destroy
    redirect_to posts_path, notice: t('posts.post_is_deleted')
  end

  private

  def find_post
    @find_post ||= Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :social_id, :body, :started_at)
  end

  def set_active_storage_host
    ActiveStorage::Current.host = request.base_url
  end
end
