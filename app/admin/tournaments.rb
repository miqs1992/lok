# frozen_string_literal: true

ActiveAdmin.register Tournament do # rubocop:disable Metrics/BlockLength
  config.sort_order = 'start_date_asc'
  permit_params :name, :start_date, :tournament_type
  config.filters = false

  form { |f| render 'tournaments/form', form: f }
  show { render 'tournaments/show_panel' }

  index download_links: false do
    column(:name) { |t| auto_link(t) }
    column :start_date
    column :tournament_type
    column(:teams) { |t| t.teams.size }
    column(:players) { |t| t.players.size }
    actions
  end

  action_item :individual_classification, only: :show do
    link_to I18n.t('active_admin.pages.individual_classification'),
            individual_classification_tournament_path(resource)
  end

  action_item :team_classification, only: :show do
    link_to I18n.t('active_admin.pages.team_classification'),
            team_classification_tournament_path(resource)
  end

  action_item :add_team, only: :show do
    link_to I18n.t('active_admin.pages.add_teem'), new_tournament_team_path(resource)
  end

  action_item :go_back, only: %i[team_classification individual_classification] do
    link_to I18n.t('active_admin.pages.go_back'), tournament_path(resource)
  end

  action_item :download_team_csv, only: :team_classification do
    link_to I18n.t('active_admin.pages.download_csv'),
            team_classification_tournament_path(resource, format: :csv)
  end

  action_item :download_individual_csv, only: :individual_classification do
    link_to I18n.t('active_admin.pages.download_csv'),
            individual_classification_tournament_path(resource, format: :csv)
  end

  member_action :individual_classification,
                title: I18n.t('active_admin.pages.individual_classification') do
    @players = resource.players.individual_classification
    respond_to do |format|
      format.html
      format.csv do
        send_data @players.to_csv, filename: "#{resource.name}-individual-classification.csv"
      end
    end
  end

  member_action :team_classification, title: I18n.t('active_admin.pages.team_classification') do
    respond_to do |format|
      format.html
      format.csv do
        send_data resource.teams.to_csv, filename: "#{resource.name}-team-classification.csv"
      end
    end
  end
end
