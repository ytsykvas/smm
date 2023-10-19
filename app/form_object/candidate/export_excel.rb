class Candidate::ExportExcel < ServiceBase
  def initialize(candidates)
    @candidates = candidates
  end

  def generate_excel
    book = Spreadsheet::Workbook.new
    sheet = book.create_worksheet(name: 'Candidates')
    document_header(sheet)
    row_index = 1

    @candidates.each do |candidate|
      row_index += 1
      candidate_data(candidate, sheet, row_index)
    end

    book.write("candidates.xls")
    "candidates.xls"
  end

  def document_header(sheet)
    sheet.row(0).default_format = Spreadsheet::Format.new(weight: :bold)
    sheet.row(0).push("Position: #{@candidates.first.position.title}")
    sheet.row(1).push("Number", "Name", "Email", "Phone", "Place")
  end

  def candidate_data(candidate, sheet, row_index)
    sheet[row_index, 0] = row_index - 1
    sheet[row_index, 1] = candidate.name
    sheet[row_index, 2] = candidate.email
    sheet[row_index, 3] = candidate.phone
    sheet[row_index, 4] = candidate.remotely? ? "remotely" : "office"
  end
end
