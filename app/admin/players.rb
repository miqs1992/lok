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
    end

    panel 'Scores' do
      table_for player.shields do
        (1..10).each { |i| column "p#{i}".to_sym }
        column :points
      end
    end
  end
end
