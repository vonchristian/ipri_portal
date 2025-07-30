# frozen_string_literal: true

class DraftCaseDetails::Publication < ActiveInteraction::Base
  object :draft_case_detail, class: CaseDetails::DraftCaseDetail

  def execute
    case_detail = CaseDetails::CaseDetail.create!(
      reference_number: draft_case_detail.reference_number,
      organization_name: draft_case_detail.organization_name,
      submission_date_day: draft_case_detail.submission_date.day,
      submission_date_month: draft_case_detail.submission_date.month,
      submission_date_year: draft_case_detail.submission_date.year,
      incident_hour: draft_case_detail.incident_hour,
      incident_minute: draft_case_detail.incident_minute,
      subnational_location: draft_case_detail.subnational_location,
      location_details_1: draft_case_detail.location_details_1,

      impact_to_community_details: draft_case_detail.impact_to_community_details,
    )

    create_individual_victims(case_detail)
    create_collective_victims(case_detail)
    create_criminalizations(case_detail)
    # create_human_rights_violations(case_detail)
    # create_killings(case_detail)
    # create_development_projects(case_detail)
  end

  def create_individual_victims(case_detail)
    case_detail.individual_victims.create!(
      age_bracket_id: draft_case_detail.age_bracket_id,
      full_name: draft_case_detail.full_name,
      gender: draft_case_detail.gender,
      dependent_type: draft_case_detail.dependent_type,
      ethnic_identity: draft_case_detail.ethnic_identity,
      date_of_birth_month: draft_case_detail.date_of_birth_month,
      date_of_birth_day: draft_case_detail.date_of_birth_day,
      date_of_birth_year: draft_case_detail.date_of_birth_year,
      victim_role: draft_case_detail.victim_role,
      dependent_details: draft_case_detail.dependent_details,
    )
  end

  def create_collective_victims(case_detail)
    collective_victim = case_detail.collective_victims.create!(
      affected_total: draft_case_detail.affected_total,
      refer_to_individuals: draft_case_detail.refer_to_individuals,
      male_total: draft_case_detail.male_total,
      female_total: draft_case_detail.female_total,
    )
    create_age_bracket_breakdowns(collective_victim)
  end

  def create_age_bracket_breakdowns(collective_victim)
    if draft_case_detail.age_bracket_breakdown_0_12.present?
      collective_victim.age_bracket_breakdowns.create!(
        age_bracket: AgeBracket.find_by(name: "A"),
        total: draft_case_detail.age_bracket_breakdown_0_12,
      )
    end
    if draft_case_detail.age_bracket_breakdown_13_25.present?
      collective_victim.age_bracket_breakdowns.create!(
        age_bracket: AgeBracket.find_by(name: "B"),
        total: draft_case_detail.age_bracket_breakdown_13_25,
      )
    end
    if draft_case_detail.age_bracket_breakdown_26_35.present?
      collective_victim.age_bracket_breakdowns.create!(
        age_bracket: AgeBracket.find_by(name: "C"),
        total: draft_case_detail.age_bracket_breakdown_26_35,
      )
    end
    if draft_case_detail.age_bracket_breakdown_36_59.present?
      collective_victim.age_bracket_breakdowns.create!(
        age_bracket: AgeBracket.find_by(name: "D"),
        total: draft_case_detail.age_bracket_breakdown_36_59,
      )
    end
    if draft_case_detail.age_bracket_breakdown_60_plus.present?
      collective_victim.age_bracket_breakdowns.create!(
        age_bracket: AgeBracket.find_by(name: "E"),
        total: draft_case_detail.age_bracket_breakdown_60_plus,
      )
    end
  end

  def create_criminalizations(case_detail)
    case_detail.criminalizations.create!(
      criminalization_details: draft_case_detail.criminalization_details,
      experienced_harrassment_or_intimidation: draft_case_detail.criminalization_experienced_harrassment_or_intimidation,
      harrassment_or_intimidation_details: draft_case_detail.criminalization_harrassment_or_intimidation_details,
      accusation_or_charges_details: draft_case_detail.accusation_or_charges_details,
      policies_or_laws_used: draft_case_detail.policies_or_laws_used,
      accuser_details: draft_case_detail.accuser_details,
      case_filing_status: draft_case_detail.criminalization_case_filing_status,
      case_filing_details: draft_case_detail.criminalization_case_filing_details,
      case_decision_status: draft_case_detail.case_decision_status,
      case_decision_details: draft_case_detail.case_decision_details,
      victims_in_detention: draft_case_detail.victims_in_detention,
      victims_in_detention_details: draft_case_detail.victims_in_detention_details,
      case_filing_against_perpetrator: draft_case_detail.case_filing_against_perpetrator,
      case_filing_against_perpetrator_details: draft_case_detail.case_filing_against_perpetrator_details,
      state_action_to_address_criminalization: draft_case_detail.state_action_to_address_criminalization,
    )
  end
end
