class CaseDetailPdf < Prawn::Document
  def initialize(case_detail, view_context)
    super(margin: 40, page_size: 'A4')
    @case_detail = case_detail
    @view_context = view_context
    logo_details
    move_down 5
    stroke_horizontal_rule
    move_down 5
    case_details
    move_down 20
    individual_victims
    move_down 10
    collective_victims
    move_down 10
    criminalizations
    move_down 10
    killings
    move_down 10
    human_rights_violations
  end

  private

  def case_details
    text "Case Factsheet", style: :bold, align: :center, size: 12
    text "Documenter Details", size: 10, style: :bold 
    move_down 5
    table([["First Name", "#{@case_detail.documenter_first_name}"]], cell_style: {
      borders: %i[top bottom left right], padding: 5,
      size: 10,
      inline_format: true
    }, column_widths: [200, 300]) do
    end

    table([["Last Name", "#{@case_detail.documenter_last_name}"]], cell_style: {
      borders: %i[top bottom left right], padding: 5,
      size: 10,
      inline_format: true
    }, column_widths: [200, 300]) do
    end

    table([["Organization / Affiliation", "#{@case_detail.organization_name}"]], cell_style: {
      borders: %i[top bottom left right], padding: 5,
      size: 10,
      inline_format: true
    }, column_widths: [200, 300]) do
    end

    table([["Email", "#{@case_detail.documenter_email}"]], cell_style: {
      borders: %i[top bottom left right], padding: 5,
      size: 10,
      inline_format: true
    }, column_widths: [200, 300]) do
    end

    table([["Phone Number", "#{@case_detail.documenter_phone_number}"]], cell_style: {
      borders: %i[top bottom left right], padding: 5,
      size: 10,
      inline_format: true
    }, column_widths: [200, 300]) do
    end

    table([["Are you willing to share more information with IPRI?", "#{@case_detail.willing_to_share_more_info ? "Yes" : "No"}"]], cell_style: {
      borders: %i[top bottom left right], padding: 5,
      size: 10,
      inline_format: true
    }, column_widths: [200, 300]) do
    end

    move_down 10
    text "Case Details", size: 10, style: :bold
    move_down 5

    table([["Primary Data", "#{@case_detail.primary_data ? "Yes" : "No"}"]], cell_style: {
      borders: %i[top bottom left right], padding: 5,
      size: 10,
      inline_format: true
    }, column_widths: [200, 300]) do
    end

    table([["Submission Date", "#{@case_detail.submission_date}"]], cell_style: {
      borders: %i[top bottom left right], padding: 5,
      size: 10,
      inline_format: true
    }, column_widths: [200, 300]) do
    end

    table([["Relevant Links", "#{@case_detail.data_sources}"]], cell_style: {
      borders: %i[top bottom left right], padding: 5,
      size: 10,
      inline_format: true
    }, column_widths: [200, 300]) do
    end

    table([["Tags", "#{@case_detail.tags.pluck(:name).uniq.join(',')}"]], cell_style: {
      borders: %i[top bottom left right], padding: 5,
      size: 10,
      inline_format: true
    }, column_widths: [200, 300]) do
    end

    table([["Data Sharing Agreement", "<b>#{@case_detail.data_sharing_title}</b> - #{@case_detail.data_sharing_content}"]], cell_style: {
      borders: %i[top bottom left right], padding: 5,
      size: 10,
      inline_format: true
    }, column_widths: [200, 300]) do
    end

    move_down 10
    text "Place and Date of Incident", size: 10, style: :bold
    move_down 5

    table([["Country of Incident", "#{@case_detail.country_name}"]], cell_style: {
      borders: %i[top bottom left right], padding: 5,
      size: 10,
      inline_format: true
    }, column_widths: [200, 300]) do
    end

    table([["Subnational Location", "#{@case_detail.subnational_location}"]], cell_style: {
      borders: %i[top bottom left right], padding: 5,
      size: 10,
      inline_format: true
    }, column_widths: [200, 300]) do
    end

    table([["Other Location Details (1)", "#{@case_detail.location_details_1}"]], cell_style: {
      borders: %i[top bottom left right], padding: 5,
      size: 10,
      inline_format: true
    }, column_widths: [200, 300]) do
    end

    table([["Other Location Details (2)", "#{@case_detail.location_details_2}"]], cell_style: {
      borders: %i[top bottom left right], padding: 5,
      size: 10,
      inline_format: true
    }, column_widths: [200, 300]) do
    end

    table([["Ongoing Case?", "#{@case_detail.ongoing_case ? "Yes" : "No"}"]], cell_style: {
      borders: %i[top bottom left right], padding: 5,
      size: 10,
      inline_format: true
    }, column_widths: [200, 300]) do
    end

    move_down 10
    text "Impact of Incident/s of Human Rights Violations", size: 10, style: :bold
    move_down 5

    table([["How did the incident/s affect the victim/s and his/her/their family?", "#{@case_detail.impact_to_victim_details}"]], cell_style: {
      borders: %i[top bottom left right], padding: 5,
      size: 10,
      inline_format: true
    }, column_widths: [200, 300]) do
    end

    table([["How did the incident/s affect the Indigenous Peoples group/s or community/ies and/or organization of the victim/s?", "#{@case_detail.impact_to_community_details}"]], cell_style: {
      borders: %i[top bottom left right], padding: 5,
      size: 10,
      inline_format: true
    }, column_widths: [200, 300]) do
    end

    table([["How did the incident/s affect the Indigenous Peoples group/s or community/ies and/or organization of the victim/s?", "#{@case_detail.impact_to_community_details}"]], cell_style: {
      borders: %i[top bottom left right], padding: 5,
      size: 10,
      inline_format: true
    }, column_widths: [200, 300]) do
    end

    move_down 10
    text "Other Actions and Investigations Undertaken", size: 10, style: :bold
    move_down 5

    table([["Is/Are there any other advocacy and/or action/s undertaken ?", "#{@case_detail.actions_taken_details}"]], cell_style: {
      borders: %i[top bottom left right], padding: 5,
      size: 10,
      inline_format: true
    }, column_widths: [200, 300]) do
    end

    table([["Has there been any investigation/s on the incident of other type of human right violation ?", "#{@case_detail.incident_investigation_details}"]], cell_style: {
      borders: %i[top bottom left right], padding: 5,
      size: 10,
      inline_format: true
    }, column_widths: [200, 300]) do
    end
  end

  def individual_victims
      text "Individual Victims", style: :bold, align: :center, size: 12
      move_down 5
      @case_detail.individual_victims.each_with_index do |individual_victim, index|
        text "##{index + 1}", size: 10, style: :bold
        move_down 5
  
        table([["Full Name", "#{individual_victim.full_name}"]], cell_style: {
          borders: %i[top bottom left right], padding: 5,
          size: 10,
          inline_format: true
        }, column_widths: [200, 300]) do
        end

        table([["Gender", "#{individual_victim.gender}"]], cell_style: {
          borders: %i[top bottom left right], padding: 5,
          size: 10,
          inline_format: true
        }, column_widths: [200, 300]) do
        end

        table([["Dependent Type", "#{individual_victim.dependent_type.to_s.titleize}"]], cell_style: {
          borders: %i[top bottom left right], padding: 5,
          size: 10,
          inline_format: true
        }, column_widths: [200, 300]) do
        end

        table([["Dependent Details", "#{individual_victim.dependent_details}"]], cell_style: {
          borders: %i[top bottom left right], padding: 5,
          size: 10,
          inline_format: true
        }, column_widths: [200, 300]) do
        end


        table([["Name of Indigenous Peoples’ group or Ethnic Identity of victim", "#{individual_victim.ethnic_identity}"]], cell_style: {
          borders: %i[top bottom left right], padding: 5,
          size: 10,
          inline_format: true
        }, column_widths: [200, 300]) do
        end

        table([["Date of Birth", "#{individual_victim.date_of_birth}"]], cell_style: {
          borders: %i[top bottom left right], padding: 5,
          size: 10,
          inline_format: true
        }, column_widths: [200, 300]) do
        end

        table([["Age Bracket", "#{individual_victim.age_bracket.description}"]], cell_style: {
          borders: %i[top bottom left right], padding: 5,
          size: 10,
          inline_format: true
        }, column_widths: [200, 300]) do
        end

        table([["Role of Victim in the Community", "#{individual_victim.victim_role}"]], cell_style: {
          borders: %i[top bottom left right], padding: 5,
          size: 10,
          inline_format: true
        }, column_widths: [200, 300]) do
        end
      move_down 10
    end
  end

  def collective_victims
    text "Collective Victims", style: :bold, align: :center, size: 12
    move_down 5
    @case_detail.collective_victims.each_with_index do |collective_victim, index|
      
      text "##{index + 1}", size: 10, style: :bold
      move_down 5

      table([["Number of Affected People", "#{collective_victim.affected_total}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["Does the number of affected people refer to individuals?", "#{collective_victim.refer_to_individuals ? "Yes" : "No"}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["Please provide more information about the victims", "#{collective_victim.victim_details}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["Write the number of MALE from the total number of individuals affected", "#{collective_victim.male_total}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["Write the number of FEMALE from the total number of individuals affected", "#{collective_victim.female_total}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end
    end
  end

  def criminalizations
    text "Criminalizations", style: :bold, align: :center, size: 12
    move_down 5
    @case_detail.criminalizations.each_with_index do |criminalization, index|
      
      text "Case ##{index + 1}", size: 10, style: :bold
      move_down 5

      text "Details of Criminalizations", size: 10, style: :bold

      table([["Why was/were the victim/s criminalized?", "#{sanitize_text(criminalization.criminalization_details)}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["Did the victim/s experience any form of harassment or intimidation prior to criminalization?", "#{criminalization.experienced_harrassment_or_intimidation}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["If YES, please provide more information", "#{criminalization.harrassment_or_intimidation_details}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["What was/were the accusation/s or charge/s filed against the victim/s?", "#{criminalization.accusation_or_charges_details}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["What was/were the policy/ies or law/s or institutional justification/s used against the victim/s?", "#{criminalization.policies_or_laws_used}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["Who put forward the accusation/s or charge/s against the victim/s?", "#{criminalization.accuser_categories.pluck(:title).uniq.join(", ")}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["Please provide more information about the accuser/s", "#{criminalization.policies_or_laws_used}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["Was/were the accusation/s or charge/s against the victim legally or formally filed?", "#{criminalization.case_filing_status}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["If YES, where was the case/s filed? (e.g., regional court, military court, supreme court, etc.)", "#{criminalization.case_filing_details}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["If NO, Please provide more information", "#{criminalization.case_filing_details}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["Is there a decision on the legal or formal accusation/s or charge/s filed against the victim/s?", "#{criminalization.case_decision_status}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["Please provide more information", "#{criminalization.case_decision_details}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["Is/Are the victim/s in prison or detention facility?", "#{criminalization.victims_in_detention}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["If yes, please provide more information on their conditions or situation in the prison or detention facility—do they know where is the prison or detention facility located? Are they allowed visitors?", "#{criminalization.victims_in_detention_details}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["If no, please provide more information on the current situation of the victim/s—Is/Are s/he/they in hiding? Released on bail? Awaiting court trial? On house arrest? etc", "#{criminalization.victims_in_detention_details}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["Was/Were there (a) legal case/s filed against the alleged perpetrators on behalf of the victim/s criminalized?", "#{criminalization.case_filing_against_perpetrator}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["If yes, please provide further information: Where is/are the case/s filed? Who filed the case? E.g., victim, family of the victim, support organizations, etc.; any other details of the case/s filed, please share.", "#{criminalization.case_filing_against_perpetrator}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["If no, please elaborate on your response (e.g. can you provide probable reasons on why there has been no legal case/s filed against the alleged perpetrators? Etc.)", "#{criminalization.case_filing_against_perpetrator}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["Has the State undertaken any action/s to address the incident of criminalization?", "#{criminalization.state_action_to_address_criminalization}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["If YES, please provide more information on the action/s undertaken, including any relevant results.", "#{criminalization.case_filing_against_perpetrator_details}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["If NO, please elaborate on your response", "#{criminalization.case_filing_against_perpetrator_details}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["Has there been any investigation/s on the incident of criminalization?", "#{criminalization.investigation_on_criminalization}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["If yes, please provide additional information on the investigation, including relevant date/s and institutions/ office/s or representative/s involved, e.g., national human rights institutions, United Nations body, etc.", "#{sanitize_text(criminalization.investigation_on_criminalization_details)}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["If no, please elaborate on your response. (e.g. can you provide probable reasons on why there has been no investigation/s conducted? Or, is the case not yet publicly reported? Etc.)", "#{criminalization.investigation_on_criminalization_details}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["Impact/s of the Incident/s of Human Rights Violation", "#{criminalization.impact_to_victim_details}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["How did the incident/s affect the Indigenous Peoples group/s or community/ies and/or organization of the victim/s?", "#{criminalization.impact_to_community_details}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end
    move_down 10
    end
  end

  def killings
    text "Killings", style: :bold, align: :center, size: 12
    move_down 5
    @case_detail.killings.each_with_index do |killing, index|
      
      text "Case ##{index + 1}", size: 10, style: :bold
      move_down 5
      text "Details of Killings", size: 10, style: :bold
      move_down 5
      table([["Why was/were the victim/s killed?", "#{sanitize_text(killing.killing_details)}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["How was the killing carried out?", "#{sanitize_text(killing.killing_carried_out)}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["Did the victim/s experience any form of harassment or intimidation prior to criminalization?", "#{killing.experienced_harrassment_or_intimidation}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["If YES, please provide more information?", "#{sanitize_text(killing.harrassment_or_intimidation_details)}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["Is/Are the alleged perpetrator/s known?", "#{killing.alleged_perpetrators_known}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["Who put forward the accusation/s or charge/s against the victim/s?", "#{killing.perpetrator_categories.pluck(:title).uniq.join(", ")}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["Please provide more information", "#{killing.alleged_perpetrator_details}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      move_down 10
      text "Status of Incident of Killing", size: 10, style: :bold
      move_down 5
      table([["Was/Were there (a) legal case/s filed against the alleged perpetrators on behalf of the victim/s killed?", "#{killing.case_filing_status}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["If YES, please provide further information: Where is/are the case/s filed? Who filed the case? E.g., victim, family of the victim, support organizations, etc.; any other details of the case/s filed, please share", "#{killing.case_filing_details}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["Has the State undertaken any action/s to address the incident of killing?", "#{killing.state_action_to_address_killing}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["If yes, please provide more information on the action/s undertaken, including any relevant results", "#{killing.state_action_to_address_killing_details}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["If No, please elaborate on your response. (e.g. can you provide probable reasons on why there has been no legal case/s filed against the alleged perpetrators? Etc.)", "#{killing.state_action_to_address_killing_details}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["Has there been any investigation/s on the incident of killing?", "#{killing.investigation_on_killing}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["If yes, please provide additional information on the investigation, including relevant date/s and institutions/ office/s or representative/s involved, e.g., national human rights institution, United Nations body, etc.", "#{killing.investigation_on_killing_details}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["If no, please elaborate on your response. (e.g. can you provide probable reasons on why there has been no investigation/s conducted? Or, is the case not yet publicly reported? Etc.)", "#{killing.investigation_on_killing_details}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end
    end
  end

  def human_rights_violations
    text "Other Types of Human Rights Violation", style: :bold, align: :center, size: 12
    move_down 5
    @case_detail.human_rights_violations.each_with_index do |violation, index|
      text "Case ##{index + 1}", size: 10, style: :bold
      move_down 5
      text "Human Rights Violation Details", size: 10, style: :bold
      move_down 5

      table([["What was/were the human rights violation/s?", "#{violation.categories.pluck(:title).uniq.join(", ")}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["What caused the Human Rights Violation?", "#{violation.violation_details}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["Is/Are the alleged perpetrator/s known?", "#{violation.alleged_perpetrators_known ? "Yes" : "No"}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["Please provide more information for the alleged perpetrators", "#{violation.alleged_perpetrator_details}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      move_down 5
      text "Status of Incident of Human Rights Violation", size: 10, style: :bold
      move_down 5

      table([["Was/Were there legal case/s filed against the alleged perpetrators on behalf of the victim/s?", "#{violation.case_filing_status ? "Yes" : "No"}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["If yes, please provide further information of the state of the case", "#{violation.case_filing_details}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["If no, please elaborate on your response. (e.g. can you provide probable reasons on why there has been no legal case/s filed against the alleged perpetrators? Etc.)", "#{violation.case_filing_details}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["Has the State undertaken any action/s to address the incident of human rights violation/s?", "#{violation.state_action_to_address_violation}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["If yes, please provide more information on the action/s undertaken, including any relevant results.", "#{violation.state_action_to_address_violation_details}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["If No, please elaborate on your response.", "#{violation.state_action_to_address_violation_details}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["Has there been any investigations/actions on the incident taken by other actors?", "#{violation.investigation_on_violation ? "Yes" : "No"}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["If yes, please provide additional information on the investigation, including relevant date/s and institutions/ office/s or representative/s involved, e.g., national human rights institution, United Nations body, Civil Society, Community, etc.)", "#{violation.investigation_on_violation_details}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end

      table([["If no, please elaborate on your response. (e.g. can you provide probable reasons on why there has been no investigation/s conducted? Or, is the case not yet publicly reported? Etc.)", "#{violation.investigation_on_violation_details}"]], cell_style: {
        borders: %i[top bottom left right], padding: 5,
        size: 10,
        inline_format: true
      }, column_widths: [200, 300]) do
      end
    end
  end

  def logo_details
    image(Rails.root.join("app/assets/images/logo.png"), width: 160)
  end

  def sanitize_text(text)
    text.to_s.encode('Windows-1252', invalid: :replace, undef: :replace, replace: '')
  end
end
