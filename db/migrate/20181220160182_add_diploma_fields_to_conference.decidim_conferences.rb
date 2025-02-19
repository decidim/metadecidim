# frozen_string_literal: true

# This migration comes from decidim_conferences (originally 20181106092826)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddDiplomaFieldsToConference < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_conferences, :signature_name, :string
    add_column :decidim_conferences, :signature, :string
    add_column :decidim_conferences, :main_logo, :string
    add_column :decidim_conferences, :sign_date, :date, index: true
    add_column :decidim_conferences, :diploma_sent_at, :datetime, index: true
  end
end
