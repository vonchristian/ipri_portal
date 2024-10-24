module CountriesHelper
  def sort_link(column:, label:)
    direction = column == params[:column] ? next_direction : 'asc'
    link_to(label, countries_path(column: column, direction: direction), data: { turbo_action: 'replace' })
  end

  def next_direction
    params[:direction] == 'asc' ? 'desc' : 'asc'
  end
end