# frozen_string_literal: true

ActiveAdmin.register Team do
  belongs_to :tournament
  permit_params :name, players_attributes: %i[name _destroy id]

  form { |f| render 'teams/form', form: f }

  action_item :go_back, only: %i[show edit] do
    link_to I18n.t('active_admin.pages.go_back'), tournament_path(resource.tournament_id)
  end
end
