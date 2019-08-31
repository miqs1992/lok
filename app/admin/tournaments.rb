# frozen_string_literal: true

ActiveAdmin.register Tournament do
  permit_params :name, :start_date, :tournament_type
  config.filters = false

  form { |f| render 'tournaments/form', form: f }

  show { render 'tournaments/show_panel' }

  action_item :individual_classification, only: :show do
    link_to 'Individual classification', individual_classification_tournament_path(resource)
  end

  action_item :add_team, only: :show do
    link_to 'Add team', new_tournament_team_path(resource)
  end

  member_action :individual_classification do
    @players = resource.players.order(points: :desc)
  end
end
