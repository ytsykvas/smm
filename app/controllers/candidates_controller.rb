class CandidatesController < ApplicationController
  def candidates
    @candidates = find_position.candidates.paginate(page: params[:page], per_page: 5)
  end

  def new_candidate
    @candidate = Candidate.new
    @candidate.position_id = find_position.id
  end

  def create
    create_candidate = Candidate::CreateCandidate.new(params: candidate_params)
    if create_candidate.perform
      redirect_to positions_path, notice: 'Sent reply'
    else
      redirect_to new_candidate_path(candidate_params[:position_id]), notice: create_candidate.error_message.to_s
    end
  end

  private

  def find_position
    @find_position ||= Position.find(params[:id])
  end

  def candidate_params
    params.require(:candidate).permit(:name, :phone, :email, :remotely, :position_id)
  end
end
