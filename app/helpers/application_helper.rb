# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def humanize_yes_no(value)
    return '—' if value.blank?
    value == 'yes' ? 'Yes' : 'No'
  end
  
  def yes_no_options
    [['No', 'No'], ['Yes', 'Yes'], ['No Information', 'No Information']]
  end

  def pagy_nav_custom(pagy)
    link_class = "px-4 py-2 border rounded-md hover:bg-gray-100"
    active_class = "bg-gray-200 text-white font-bold"

    html = '<nav class="flex justify-center space-x-2 mt-4">'.html_safe

    # Previous link
    html << (pagy.prev ? link_to("Prev", url_for(page: pagy.prev), class: link_class) : '<span class="opacity-50 px-4 py-2 border rounded-md">Prev</span>'.html_safe)

    # Page links
    pagy.series.each do |item|
      html << if item.is_a?(Integer)
                link_to(item, url_for(page: item), class: [link_class, (active_class if item == pagy.page)].compact.join(" "))
              else
                "<span class='px-4 py-2'>#{item}</span>".html_safe
              end
    end

    # Next link
    html << (pagy.next ? link_to("Next", url_for(page: pagy.next), class: link_class) : '<span class="opacity-50 px-4 py-2 border rounded-md">Next</span>'.html_safe)

    html << '</nav>'.html_safe
    html
  end


end
