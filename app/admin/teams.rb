# frozen_string_literal: true

ActiveAdmin.register Team do
  belongs_to :tournament
  permit_params :name, players_attributes: %i[name _destroy id]

  form do |f|
    f.inputs do
      f.input :name, include_blank: false
      f.has_many :players, allow_destroy: true do |p|
        p.input :name, include_blank: false
      end
    end
    f.actions
  end

  controller do
    def create
      super do |success, _failure|
        success.html do
          tournament = Tournament.find(permitted_params[:tournament_id])
          tournament.teams << resource
          redirect_to tournament_path(tournament)
        end
      end
    end
  end
end
