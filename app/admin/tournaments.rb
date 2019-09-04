# frozen_string_literal: true

ActiveAdmin.register Tournament do
  permit_params :name, :start_date, :tournament_type
  config.filters = false

  form { |f| render 'tournaments/form', form: f }

  show { render 'tournaments/show_panel' }

  action_item :individual_classification, only: :show do
    link_to 'Individual classification', individual_classification_tournament_path(resource)
  end

  action_item :team_classification, only: :show do
    link_to 'Team classification', team_classification_tournament_path(resource)
  end

  action_item :add_team, only: :show do
    link_to 'Add team', new_tournament_team_path(resource)
  end

  action_item :go_back, except: %i[show index] do
    link_to 'Go back', tournament_path(resource)
  end

  action_item :download_team_csv, only: :team_classification do
    link_to 'Download CSV',
            team_classification_tournament_path(resource, format: :csv)
  end

  action_item :download_individual_csv, only: :individual_classification do
    link_to 'Download CSV',
            individual_classification_tournament_path(resource, format: :csv)
  end

  member_action :individual_classification do
    @players = resource.players.individual_classification
    respond_to do |format|
      format.html
      format.csv do
        send_data @players.to_csv, filename: "#{resource.name}-individual-classification.csv"
      end
    end
  end

  member_action :team_classification do
    respond_to do |format|
      format.html
      format.csv do
        send_data resource.teams.to_csv, filename: "#{resource.name}-team-classification.csv"
      end
    end
  end
end
