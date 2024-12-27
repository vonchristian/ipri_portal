# frozen_string_literal: true

class IpriEmployeeDashboard < ActiveInteraction::Base
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
        OpenStruct.new(sort_order: 1, title: "Violations of FPIC", count: fpic_count),
        OpenStruct.new(sort_order: 2, title: "Arbitrary Detention", count: arbitrary_detention_count),
        OpenStruct.new(sort_order: 3, title: "Sexual Violence", count: sexual_violence_count),
        OpenStruct.new(sort_order: 4, title: "Kidnapping", count: kidnapping_count),
        OpenStruct.new(sort_order: 5, title: "Transition Energy", count: transition_energy_count),
        OpenStruct.new(sort_order: 6, title: "Transition Mineral Mining", count: mining_count),
        OpenStruct.new(sort_order: 7, title: "Conservation", count: conservation_count)
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

  def fpic_count
    HumanRightsViolations::Category.find_by(title: "Violation of collective right to free, prior and informed consent")&.human_rights_violations_count
  end

  def arbitrary_detention_count
    HumanRightsViolations::Category.find_by!(title: "Arbitrary detention")&.human_rights_violations_count
  end

  def sexual_violence_count
    HumanRightsViolations::Category.find_by(title: "Sexual Violence and other forms of gender-based violence")&.human_rights_violations_count
  end

  def kidnapping_count
    HumanRightsViolations::Category.find_by(title: "Kidnapping")&.human_rights_violations_count
  end

  def transition_energy_count
    DevelopmentProjects::Category.find_by(name: "Transition Energy (Solar, Wind, Hydro, Biomass, Geothermal, and others)")&.case_details_count
  end

  def mining_count
    DevelopmentProjects::Category.find_by(name: "Mining (gold, silver, diamonds, sands, and other metals and minerals)")&.case_details_count
  end

  def conservation_count
    DevelopmentProjects::Category.find_by!(name: "Conservation (Protected Area Designation, Wildlife, Water, Reforestation and Others)")&.case_details_count
  end
end