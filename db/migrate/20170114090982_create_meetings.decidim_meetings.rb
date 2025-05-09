# frozen_string_literal: true

# This migration comes from decidim_meetings (originally 20161130121354)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class CreateMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :decidim_meetings_meetings do |t|
      t.jsonb :title
      t.jsonb :description
      t.jsonb :short_description
      t.datetime :start_time
      t.datetime :end_time
      t.text :address
      t.jsonb :location
      t.jsonb :location_hints
      t.references :decidim_feature, index: true
      t.references :decidim_author, index: true
      t.references :decidim_scope, index: true
      t.references :decidim_category, index: true

      t.timestamps
    end
  end
end
