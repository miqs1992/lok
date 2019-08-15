# frozen_string_literal: true

ActiveAdmin.register Tournament do
  permit_params :name, :start_date, :tournament_type,
                teams_attributes: [:name, :_destroy, :id,
                                   players_attributes: %i[name _destroy id]]

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
    f.inputs do
      f.has_many :teams, allow_destroy: true do |a|
        a.input :name
        a.has_many :players, allow_destroy: true do |b|
          b.input :name
        end
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :tournament_type
      row :start_date
    end

    tournament.teams.includes(:players).order(:name).each_slice(2) do |teams|
      columns do
        teams.each do |team|
          column do
            panel team.name do
              table_for team.players do
                column :name
                column :score
                column :actions
              end
            end
          end
        end
      end
    end
  end
end
