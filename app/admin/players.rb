# frozen_string_literal: true

ActiveAdmin.register Player do
  permit_params :name, shields_attributes: [:id, :_destroy, *(1..10).map { |i| "p#{i}".to_sym }]
  menu false

  form { |f| render 'players/form', form: f }

  show do
    attributes_table do
      row :name
      row :team
      row :tournament
      row :points
    end

    panel 'Scores' do
      table_for player.shields do
        (1..10).each { |i| column "p#{i}".to_sym }
        column :points
      end
    end
  end

  action_item :go_back, only: %i[show edit] do
    link_to I18n.t('active_admin.pages.go_back'), tournament_path(resource.tournament)
  end
end
