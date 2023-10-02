class PostsController < ApplicationController
  before_action :find_post, only: %i[show destroy]

  def index
    @posts = Post.all
  end

  def show
    @allowed_users = %w[admin manager employee]
    find_post
  end

  def new
    @post = Post.new
  end

  def create

  end

  def destroy
    find_post.destroy!
  end

  private

  def find_post
    @find_post ||= Post.find(params[:id])
  end

  def post_params

  end
end
