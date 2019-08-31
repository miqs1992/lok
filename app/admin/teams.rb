# frozen_string_literal: true

ActiveAdmin.register Team do
  belongs_to :tournament
  permit_params :name, players_attributes: %i[name _destroy id]

  form { |f| render 'teams/form', form: f }

  action_item :go_to_tournament, only: :show do
    link_to 'Tournament', tournament_path(resource.tournament)
  end
end
