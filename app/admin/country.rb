ActiveAdmin.register Country do
  filter :name
  filter :priority
  filter :case_details_count
  filter :killings_count
  filter :human_rights_violations_count
  filter :criminalizations_count

  permit_params :priority,
    :case_details_count,
    :killings_count,
    :criminalizations_count,
    :human_rights_violations_count

  index do
    selectable_column
    id_column
    column :name
    column :priority
    column :case_details_count
    column :killings_count
    column :criminalizations_count
    column :human_rights_violations_count
  end

  form do |f|
    f.inputs do
      f.input :priority
      f.input :case_details_count
      f.input :killings_count
      f.input :criminalizations_count
      f.input :human_rights_violations_count
    end

    f.actions
  end
end