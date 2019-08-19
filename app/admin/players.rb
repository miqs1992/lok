# frozen_string_literal: true

ActiveAdmin.register Player do
  permit_params :name, shields_attributes: [:id, :_destroy, *(1..10).map { |i| "p#{i}".to_sym }]

  form do |f|
    f.inputs do
      f.input :name, include_blank: false
    end
    f.inputs do
      f.has_many :shields, allow_destroy: true do |s|
        (1..10).each { |i| s.input "p#{i}".to_sym }
      end
    end
    f.actions
  end

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
