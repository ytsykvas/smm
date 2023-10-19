class Candidate::ExportPdf < ServiceBase
  def initialize(candidates)
    @candidates = candidates
  end

  def generate_pdf
    document_header
    counter = 1

    @candidates.each do |candidate|
      @pdf.text "#{counter}.", style: :bold
      candidate_data(@pdf, candidate)
      counter += 1
    end

    @pdf.render
  end

  private

  def document_header
    @pdf = Prawn::Document.new
    @pdf.text "List of Candidates", style: :bold
    @pdf.text "Position: #{@candidates.first.position.title}", style: :bold
    @pdf.text "Downloaded: #{Time.now.to_date}", style: :bold
    @pdf.move_down(10)
  end

  def candidate_data(pdf, candidate)
    pdf.text candidate.name
    pdf.text "Email: #{candidate.email}"
    pdf.text "Phone: #{candidate.phone}"
    pdf.move_down(10)
  end
end
