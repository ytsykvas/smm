class Position::CreatePosition < ServiceBase
  attr_reader :user

  def initialize(params:, user:)
    @params = params
    @user = user
    @position = nil
  end

  def perform
    if validate_position
      modify_experience_param
      build_position
      save_position
    else
      @error_message = "Error creating position: Title and body are required."
      false
    end
  end

  private

  def validate_position
    if @params[:title].present? && @params[:body].present?
      true
    else
      @error_message = "Title and body are required."
      false
    end
  end

  def build_position
    @position = Position.new(@params.permit(:title, :body, :experience))
  end

  def modify_experience_param
    @params[:experience] = '0' if @experience.blank? || @experience.negative?
  end

  def add_technologies_to_position
    technologies = Technology.where(id: @params[:technology_ids])
    Position.last.technologies << technologies
  end

  def save_position
    if @position.save
      add_technologies_to_position
      true
    else
      @error_message = @position.errors.full_messages.join(", ")
      false
    end
  end

  def experience
    @experience ||= @params[:position][:experience].to_i
  end
end
