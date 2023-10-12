class Candidate::CreateCandidate < ServiceBase
  attr_accessor :params

  def initialize(params:)
    @params = params
  end

  def perform
    if reply_valid?
      build_candidate
      save_candidate
      add_reply_to_position
    else
      add_error_message(@error_message)
      false
    end
  end

  private

  def reply_valid?
    valid_candidate_params? && position_present? && first_users_reply?
  end

  def valid_candidate_params?
    required_fields = %i[name phone email remotely position_id]
    if required_fields.all? { |field| @params.key?(field) && @params[field].present? }
      true
    else
      add_error_message("Name, phone, email, remotely, and position_id are required fields.")
      false
    end
  end

  def position_present?
    if Position.exists?(@params[:position_id])
      true
    else
      add_error_message("Position with ID #{@params[:position_id]} does not exist.")
      false
    end
  end

  def first_users_reply?
    if find_position.candidates.where(email: @params[:email]).blank?
      true
    else
      add_error_message("A candidate with this email has already replied to this position.")
      false
    end
  end

  def build_candidate
    @candidate = Candidate.new(@params.permit(:name, :phone, :email, :remotely, :position_id))
  end

  def add_reply_to_position
    find_position.update(replies: position_replies + 1)
  end

  def send_reply_email
  end

  def find_position
    @find_position ||= Position.find(@params[:position_id])
  end

  def position_replies
    find_position.replies
  end

  def save_candidate
    if @candidate.save
      send_reply
    else
      add_error_message("Something wrong with sending email.")
    end
  end

  def send_reply
    CandidateMailer.reply_email(@candidate).deliver_now
  rescue StandardError => e
    add_error_message("Email sending failed: #{e.message}")
  end
end
