# frozen_string_literal: true

class CountryPartnerDashboard < ActiveInteraction::Base
  def execute
    {
      criminalizations_count: criminalizations_count,
      current_year_criminalizations_count: current_year_criminalizations_count,
      killings_count: killings_count,
      current_year_killings_count: current_year_killings_count,
      case_details_count: case_details_count,
      current_year_case_details_count: current_year_case_details_count,
      human_rights_violations_count: human_rights_violations_count,
      current_year_human_rights_violations_count: current_year_human_rights_violations_count,
      human_rights_violations: [
        OpenStruct.new(sort_order: 1, category_class: "HumanRightsViolations::Category", id: fpic.id, title: "Violations of FPIC", count: fpic.case_details.count),
        OpenStruct.new(sort_order: 2, category_class: "HumanRightsViolations::Category", id: arbitrary_detention.id, title: arbitrary_detention.title, count: arbitrary_detention.case_details.count),
        OpenStruct.new(sort_order: 3, category_class: "HumanRightsViolations::Category", id: sexual_violence.id, title: 'Sexual Violence', count: sexual_violence.case_details.count),
        OpenStruct.new(sort_order: 4, category_class: "HumanRightsViolations::Category", id: kidnapping.id, title: kidnapping.title, count: kidnapping.case_details.count),
        OpenStruct.new(sort_order: 5, category_class: "DevelopmentProjects::Category", id: transition_energy.id, title: "Transition Energy", count: transition_energy.case_details_count),
        OpenStruct.new(sort_order: 6, category_class: "DevelopmentProjects::Category", id: mining.id, title: "Transition Mineral Mining", count: mining.case_details_count),
        OpenStruct.new(sort_order: 7, category_class: "DevelopmentProjects::Category", id: conservation.id, title: "Conservation", count: conservation.case_details_count)
      ]
    }
  end

  private

  def criminalizations_count
    Criminalizations::Criminalization.all.size
  end

  def current_year_criminalizations_count
    Criminalizations::Criminalization.submitted_current_year.size
  end
  def killings_count
    Killings::Killing.all.size
  end

  def current_year_killings_count
    Killings::Killing.submitted_current_year.size
  end

  def human_rights_violations_count
    HumanRightsViolations::HumanRightsViolation.all.size
  end

  def current_year_human_rights_violations_count

  end

  def case_details_count
    CaseDetails::CaseDetail.all.size
  end

  def current_year_case_details_count
    CaseDetails::CaseDetail.submitted_current_year.size
  end

  def human_rights_violations_count
    HumanRightsViolations::HumanRightsViolation.all.size
  end

  def current_year_human_rights_violations_count
    HumanRightsViolations::HumanRightsViolation.submitted_current_year.size
  end

  def fpic
    @fpic ||= HumanRightsViolations::Category.fpic
  end

  def arbitrary_detention
    @arbitrary_detention ||= HumanRightsViolations::Category.find_by!(title: "Arbitrary detention")
  end

  def sexual_violence
    @sexual_violence ||= HumanRightsViolations::Category.sexual_violence
  end

  def kidnapping
    @kidnapping ||= HumanRightsViolations::Category.kidnapping
  end

  def transition_energy
    @transition_energy ||= DevelopmentProjects::Category.transition_energy
  end

  def mining
    @mining ||= DevelopmentProjects::Category.mining
  end

  def conservation
    @conservation ||= DevelopmentProjects::Category.conservation
  end
end