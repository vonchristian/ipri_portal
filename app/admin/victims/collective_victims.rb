ActiveAdmin.register(Victims::CollectiveVictim, as: "Collective Victims") do
  belongs_to :case_detail, class_name: "CaseDetails::CaseDetail"
  permit_params :affected_total,
    :victim_details,
    :refer_to_individuals,
    :male_total,
    :female_total,
    :indigenous_group_description

  form do |f|
    f.inputs do
      f.input :case_detail_id, as: :hidden, input_html: { value: params[:case_detail_id] }
      f.input :affected_total
      f.input :victim_details
      f.input :refer_to_individuals
      f.input :male_total
      f.input :female_total
    end

    f.actions
  end

  controller do
    def destroy
    collective_victim = Victims::CollectiveVictim.find(params[:id])
      case_detail = collective_victim.case_detail

      super do |format|
        redirect_to admin_case_detail_path(case_detail), notice: "Human rights violation deleted successfully." and return
      end
    end
  end
end