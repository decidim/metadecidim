# frozen_string_literal: true

# This migration comes from decidim_proposals (originally 20180927111721)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class CreateParticipatoryTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :decidim_proposals_participatory_texts do |t|
      t.jsonb :title
      t.jsonb :description
      t.belongs_to :decidim_component, null: false, index: { name: "idx_participatory_texts_on_decidim_component_id" }

      t.timestamps
    end
  end
end
