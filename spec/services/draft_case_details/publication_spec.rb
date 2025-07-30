# frozen_string_literal: true

require "rails_helper"

RSpec.describe(DraftCaseDetails::Publication) do
  subject(:run_service) { described_class.run!(draft_case_detail: draft_case_detail) }

  let(:age_bracket) { create(:age_bracket) }
  let(:draft_case_detail) { create(:draft_case_detail, draft_attributes) }
  let(:draft_attributes) do
    {
      reference_number: "REF123",
      organization_name: "Test Organization",
      submission_date: Date.new(2023, 6, 15),
      incident_hour: 14,
      incident_minute: 30,
      subnational_location: "Test Location",
      location_details_1: "Location Details",
      impact_to_community_details: "Community Impact",
      age_bracket_id: age_bracket.id,
      full_name: "John Doe",
      gender: "male",
      dependent_type: "with_dependents",
      ethnic_identity: "Indigenous",
      date_of_birth_month: 5,
      date_of_birth_day: 10,
      date_of_birth_year: 1990,
      victim_role: "Leader",
      dependent_details: "Has 2 children",
      affected_total: 50,
      refer_to_individuals: true,
      male_total: 25,
      female_total: 25,
      age_bracket_breakdown_0_12: 10,
      age_bracket_breakdown_13_25: 15,
      age_bracket_breakdown_26_35: 12,
      age_bracket_breakdown_36_59: 8,
      age_bracket_breakdown_60_plus: 5,
      criminalization_details: "Protesting against mining",
      criminalization_experienced_harrassment_or_intimidation: "yes",
      criminalization_harrassment_or_intimidation_details: "Received threats",
      accusation_or_charges_details: "Illegal assembly",
      policies_or_laws_used: "Public Order Act",
      accuser_details: "Local authorities",
      criminalization_case_filing_status: "yes",
      criminalization_case_filing_details: "Regional court",
      case_decision_status: "pending",
      case_decision_details: "Awaiting trial",
      victims_in_detention: "no",
      victims_in_detention_details: "Released on bail",
      case_filing_against_perpetrator: "no",
      case_filing_against_perpetrator_details: "No investigation conducted",
      state_action_to_address_criminalization: "no"
    }
  end

  let(:case_detail) { CaseDetails::CaseDetail.last }

  before do
    Rails.application.load_seed
  end

  describe "#execute" do
    it "creates a case detail" do
      expect { run_service }.to(change(CaseDetails::CaseDetail, :count).by(1))
    end

    it "creates an individual victim" do
      expect { run_service }.to(change(Victims::IndividualVictim, :count).by(1))
    end

    it "creates a collective victim" do
      expect { run_service }.to(change(Victims::CollectiveVictim, :count).by(1))
    end

    it "creates a criminalization" do
      expect { run_service }.to(change(Criminalizations::Criminalization, :count).by(1))
    end

    context "when case detail is created" do
      before { run_service }

      it "has correct reference number" do
        expect(case_detail.reference_number).to(eq("REF123"))
      end

      it "has correct organization name" do
        expect(case_detail.organization_name).to(eq("Test Organization"))
      end

      it "has correct submission date" do
        expect(case_detail.submission_date_day).to(eq(15))
        expect(case_detail.submission_date_month).to(eq("6"))
        expect(case_detail.submission_date_year).to(eq(2023))
      end
    end

    context "when individual victim is created" do
      before { run_service }

      let(:individual_victim) { Victims::IndividualVictim.last }

      it "has correct attributes" do
        expect(individual_victim.full_name).to(eq("John Doe"))
        expect(individual_victim.gender).to(eq("male"))
        expect(individual_victim.ethnic_identity).to(eq("Indigenous"))
      end

      it "is associated with case detail" do
        expect(individual_victim.case_detail).to(eq(CaseDetails::CaseDetail.last))
      end
    end
  end

  describe "#create_collective_victims" do
    it "creates a collective victim" do
      expect { run_service }
        .to(change(Victims::CollectiveVictim, :count).by(1))
    end

    context "when collective victim is created" do
      before { run_service }

      let(:collective_victim) { Victims::CollectiveVictim.last }

      it "has correct attributes" do
        expect(collective_victim.affected_total).to(eq("50"))
        expect(collective_victim.male_total).to(eq(25))
        expect(collective_victim.female_total).to(eq(25))
      end
    end
  end

  describe "#create_age_bracket_breakdowns" do
    let(:collective_victim) { create(:collective_victim) }

    let(:service) { described_class.new(draft_case_detail: draft_case_detail) }

    it "creates age bracket breakdowns" do
      expect { run_service }
        .to(change(Victims::AgeBracketBreakdown, :count).by(5))
    end

    context "when breakdowns are created" do
      before { run_service }

      let(:breakdowns) { Victims::AgeBracketBreakdown.last(5) }

      it "has correct counts" do
        expect(breakdowns.map(&:total)).to(contain_exactly(5, 8, 10, 15, 12))
      end

      it "has correct age brackets" do
        expect(breakdowns.map { |b| b.age_bracket.name }).to(contain_exactly("A", "B", "C", "D", "E"))
      end
    end
  end

  describe "#create_criminalizations" do
    it "creates a criminalization" do
      expect { run_service }
        .to(change(Criminalizations::Criminalization, :count).by(1))
    end

    context "when criminalization is created" do
      before { run_service }

      let(:criminalization) { Criminalizations::Criminalization.last }

      it "has correct details" do
        expect(criminalization.criminalization_details).to(eq("Protesting against mining"))
        expect(criminalization.experienced_harrassment_or_intimidation).to(eq("yes"))
        expect(criminalization.accusation_or_charges_details).to(eq("Illegal assembly"))
      end

      it "has correct case information" do
        expect(criminalization.case_filing_status).to(eq("yes"))
        expect(criminalization.case_decision_status).to(eq("pending"))
        expect(criminalization.victims_in_detention).to(eq("no"))
      end

      it "is associated with case detail" do
        expect(criminalization.reload.case_detail).to(eq(case_detail))
      end
    end
  end
end
