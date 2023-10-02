class Post::CreatePost < ServiceBase
  attr_reader :post, :user

  def initialize(params:, user:)
    @params = params
    @user = user
    @post = nil
  end

  def perform
    build_post
    false unless validate_post
    save_post
  end

  private

  def build_post
    @post = Post.new(@params.require(:post).permit(:title, :body, :image))
    @post.user = user
  end

  def validate_post
    @post.valid?
  end

  def save_post
    if @post.save
      true
    else
      @error_message = @post.errors.full_messages.join(", ")
      false
    end
  end

  def post_params
    @params.require(:post).permit(:title, :body)
  end
end
