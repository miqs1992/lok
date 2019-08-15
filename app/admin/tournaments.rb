# frozen_string_literal: true

ActiveAdmin.register Tournament do
  permit_params :name, :start_date, :tournament_type

  form do |f|
    f.inputs do
      f.input :name, include_blank: false
      f.input :tournament_type,
              as: :select,
              collection: Tournament.tournament_types.to_a,
              include_blank: false
      f.input :start_date,
              as: :date_time_picker,
              include_blank: false,
              input_html: { autocomplete: :off }
    end
    f.actions
  end
end
