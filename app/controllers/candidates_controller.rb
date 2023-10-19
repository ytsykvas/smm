class CandidatesController < ApplicationController
  def candidates
    @candidates = position_candidates.paginate(page: params[:page], per_page: 10)
  end

  def new_candidate
    @candidate = Candidate.new
    @candidate.position_id = find_position.id
  end

  def create
    create_candidate = Candidate::CreateCandidate.new(params: candidate_params)
    if create_candidate.perform
      redirect_to positions_path, notice: t('candidate.sent_reply_notice')
    else
      redirect_to new_candidate_path(candidate_params[:position_id]), notice: create_candidate.error_message.to_s
    end
  end

  def export_pdf
    @candidates = position_candidates
    pdf_service = Candidate::ExportPdf.new(@candidates)
    respond_to do |format|
      format.pdf do
        pdf_data = pdf_service.generate_pdf
        send_data pdf_data, filename: "candidates.pdf", type: "application/pdf"
      end
    end
  end

  private

  def find_position
    @find_position ||= Position.find(params[:id])
  end

  def candidate_params
    params.require(:candidate).permit(:name, :phone, :email, :remotely, :position_id)
  end

  def position_candidates
    find_position.candidates
  end
end
