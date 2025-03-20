class CaseDetailPdf < Prawn::Document
  def initialize(case_detail, view_context)
    super(margin: 40, page_size: 'A4')
    @case_detail = case_detail
    @view_context = view_context
    logo_details
    move_down 5
    stroke_horizontal_rule
    move_down 5
    text "Case Factsheet", style: :bold, align: :center, size: 12
    text "Documenter Details", size: 10
    table([["First Name", "#{@case_detail.documenter_first_name}"]], cell_style: {
      borders: %i[top bottom left right], padding: 5,
      size: 10,
      inline_format: true
    }, column_widths: [70, 200]) do
    end
  end

  private

  def logo_details
    image(Rails.root.join("app/assets/images/logo.png"), width: 160)
  end
end
