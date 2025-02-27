ActiveAdmin.register(Victims::IndividualVictim, as: "Individual Victims") do
  belongs_to :case_detail, class_name: "CaseDetails::CaseDetail"
  permit_params :full_name,
    :gender,
    :age_bracket_id,
    :dependent_type,
    :dependent_details,
    :date_of_birth_month,
    :date_of_birth_day,
    :date_of_birth_year,
    :ethnic_identity

  form do |f|
    f.inputs do
      f.input :case_detail_id, as: :hidden, input_html: { value: params[:case_detail_id] }
      f.input :full_name
      f.input :gender, collection: Victims::IndividualVictim.genders.keys
      f.input :age_bracket_id, as: :select,  collection: AgeBracket.all.map { |age_bracket| [age_bracket.name, age_bracket.id] }
      f.input :dependent_type, collection: Victims::IndividualVictim.dependent_types.keys
      f.input :dependent_details
      f.input :date_of_birth_month
      f.input :date_of_birth_day
      f.input :date_of_birth_year
      f.input :ethnic_identity
    end
    f.actions
  end

  controller do
    def destroy
    individual_victim = Victims::IndividualVictim.find(params[:id])
      case_detail = individual_victim.case_detail

      super do |format|
        redirect_to admin_case_detail_path(case_detail), notice: "Human rights violation deleted successfully." and return
      end
    end
  end

end